codeunit 50090 "DW Timestamp Mgt."
{
    SingleInstance = false;

    /// <summary>
    /// Returnerer '0x' + 16 hex-tegn (8 bytes) hvor:
    /// [0..3] = sekunder siden 2000-01-01 00:00:00Z (UInt32, big-endian)
    /// [4..7] = tieBreaker (fx Entry No. / Dimension Set ID) (UInt32, big-endian)
    /// Brug denne for unik og sortérbar ordering.
    /// </summary>
    procedure Make8(ModifiedAtUtc: DateTime; TieBreaker: Integer): Text[18]
    var
        secs: Integer;
    begin
        secs := SecondsSince2000(ModifiedAtUtc);
        if secs < 0 then
            secs := 0;
        if TieBreaker < 0 then
            TieBreaker := 0;

        exit('0x' + Int32ToHexBE(secs) + Int32ToHexBE(TieBreaker));
    end;

    /// <summary>
    /// Returnerer '0x00000000' + sekunder siden 2000-01-01Z (8 hex-tegn).
    /// Ligner rowversion (0x00000000......). Ikke garanteret unik pr. sekund.
    /// Kombinér i så fald med sekundært watermark (fx Entry No.).
    /// </summary>
    procedure Make8RowversionStyle(ModifiedAtUtc: DateTime): Text[18]
    var
        secs: Integer;
    begin
        secs := SecondsSince2000(ModifiedAtUtc);
        if secs < 0 then
            secs := 0;

        exit('0x00000000' + Int32ToHexBE(secs));
    end;

    /// Hjælper: sekunder siden 2000-01-01 00:00:00Z
    procedure SecondsSince2000(ModifiedAtUtc: DateTime): Integer
    var
        base2000: DateTime;
        diff: Duration;
    begin
        base2000 := CreateDateTime(DMY2DATE(1, 1, 2000), 000000T);
        diff := ModifiedAtUtc - base2000; // Duration i millisekunder
        exit(diff DIV 1000);
    end;

    /// Konverterer 32-bit heltal til 8 hex-tegn (big-endian)
    local procedure Int32ToHexBE(n: Integer): Text[8]
    var
        i, d: Integer;
        res: Text[8];
    begin
        if n < 0 then
            n := 0;
        res := '';
        // 8 nibbles
        for i := 1 to 8 do begin
            d := n MOD 16;
            res := HexDigit(d) + res;
            n := n DIV 16;
        end;
        exit(res);
    end;

    local procedure HexDigit(n: Integer): Text[1]
    begin
        case n of
            0..9: exit(Format(n, 0, ''));
            10:   exit('A');
            11:   exit('B');
            12:   exit('C');
            13:   exit('D');
            14:   exit('E');
            15:   exit('F');
        end;
    end;
}
