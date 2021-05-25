.class Landroid/support/v4/text/util/FindAddress;
.super Ljava/lang/Object;
.source "FindAddress.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/text/util/FindAddress$ZipRange;
    }
.end annotation


# static fields
.field private static final HOUSE_COMPONENT:Ljava/lang/String; = "(?:one|\\d+([a-z](?=[^a-z]|$)|st|nd|rd|th)?)"

.field private static final HOUSE_END:Ljava/lang/String; = "(?=[,\"\'\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]|$)"

.field private static final HOUSE_POST_DELIM:Ljava/lang/String; = ",\"\'\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final HOUSE_PRE_DELIM:Ljava/lang/String; = ":,\"\'\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final MAX_ADDRESS_LINES:I = 0x5

.field private static final MAX_ADDRESS_WORDS:I = 0xe

.field private static final MAX_LOCATION_NAME_DISTANCE:I = 0x5

.field private static final MIN_ADDRESS_WORDS:I = 0x4

.field private static final NL:Ljava/lang/String; = "\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final SP:Ljava/lang/String; = "\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000"

.field private static final WORD_DELIM:Ljava/lang/String; = ",*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final WORD_END:Ljava/lang/String; = "(?=[,*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]|$)"

.field private static final WS:Ljava/lang/String; = "\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

.field private static final kMaxAddressNameWordLength:I = 0x19

.field private static final sHouseNumberRe:Ljava/util/regex/Pattern;

.field private static final sLocationNameRe:Ljava/util/regex/Pattern;

.field private static final sStateRe:Ljava/util/regex/Pattern;

.field private static final sStateZipCodeRanges:[Landroid/support/v4/text/util/FindAddress$ZipRange;

.field private static final sSuffixedNumberRe:Ljava/util/regex/Pattern;

.field private static final sWordRe:Ljava/util/regex/Pattern;

.field private static final sZipCodeRe:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 16

    const/16 v0, 0x3b

    new-array v0, v0, [Landroid/support/v4/text/util/FindAddress$ZipRange;

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v2, 0x63

    const/4 v3, -0x1

    invoke-direct {v1, v2, v2, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v4, 0x0

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v5, 0x23

    const/16 v6, 0x24

    invoke-direct {v1, v5, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v5, 0x1

    aput-object v1, v0, v5

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v5, 0x47

    const/16 v6, 0x48

    invoke-direct {v1, v5, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v5, 0x2

    aput-object v1, v0, v5

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v6, 0x60

    invoke-direct {v1, v6, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v7, 0x3

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v8, 0x55

    const/16 v9, 0x56

    invoke-direct {v1, v8, v9, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v8, 0x4

    aput-object v1, v0, v8

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v9, 0x5a

    invoke-direct {v1, v9, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v9, 0x5

    aput-object v1, v0, v9

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v10, 0x50

    const/16 v11, 0x51

    invoke-direct {v1, v10, v11, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v10, 0x6

    aput-object v1, v0, v10

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v10, v10, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/4 v11, 0x7

    aput-object v1, v0, v11

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v11, 0x14

    invoke-direct {v1, v11, v11, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v12, 0x8

    aput-object v1, v0, v12

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v12, 0x13

    invoke-direct {v1, v12, v12, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v13, 0x9

    aput-object v1, v0, v13

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v14, 0x20

    const/16 v15, 0x22

    invoke-direct {v1, v14, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0xa

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v6, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0xb

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v14, 0x1e

    const/16 v15, 0x1f

    invoke-direct {v1, v14, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0xc

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v6, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0xd

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v6, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0xe

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v14, 0x32

    const/16 v15, 0x34

    invoke-direct {v1, v14, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0xf

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v14, 0x53

    invoke-direct {v1, v14, v14, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v15, 0x10

    aput-object v1, v0, v15

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v15, 0x3c

    const/16 v14, 0x3e

    invoke-direct {v1, v15, v14, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0x11

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v14, 0x2e

    const/16 v15, 0x2f

    invoke-direct {v1, v14, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0x12

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v14, 0x42

    const/16 v15, 0x43

    const/16 v2, 0x49

    invoke-direct {v1, v14, v15, v2, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    aput-object v1, v0, v12

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v2, 0x28

    const/16 v14, 0x2a

    invoke-direct {v1, v2, v14, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    aput-object v1, v0, v11

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v2, 0x46

    const/16 v14, 0x47

    invoke-direct {v1, v2, v14, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x15

    aput-object v1, v0, v2

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/4 v2, 0x1

    invoke-direct {v1, v2, v5, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x16

    aput-object v1, v0, v2

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v2, 0x15

    invoke-direct {v1, v11, v2, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x17

    aput-object v1, v0, v2

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v7, v8, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x18

    aput-object v1, v0, v2

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v6, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0x19

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v14, 0x30

    const/16 v15, 0x31

    invoke-direct {v1, v14, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v14, 0x1a

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v14, 0x37

    const/16 v15, 0x38

    invoke-direct {v1, v14, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v15, 0x1b

    aput-object v1, v0, v15

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v15, 0x3f

    const/16 v9, 0x41

    invoke-direct {v1, v15, v9, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v9, 0x1c

    aput-object v1, v0, v9

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v6, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v9, 0x1d

    aput-object v1, v0, v9

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v9, 0x26

    const/16 v15, 0x27

    invoke-direct {v1, v9, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v9, 0x1e

    aput-object v1, v0, v9

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v9, 0x38

    invoke-direct {v1, v14, v9, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v9, 0x1f

    aput-object v1, v0, v9

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v9, 0x1b

    const/16 v15, 0x1c

    invoke-direct {v1, v9, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v9, 0x20

    aput-object v1, v0, v9

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v9, 0x3a

    const/16 v15, 0x3a

    invoke-direct {v1, v9, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v9, 0x21

    aput-object v1, v0, v9

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v9, 0x44

    const/16 v15, 0x45

    invoke-direct {v1, v9, v15, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v9, 0x22

    aput-object v1, v0, v9

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v7, v8, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v7, 0x23

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/4 v7, 0x7

    const/16 v8, 0x8

    invoke-direct {v1, v7, v8, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v7, 0x24

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v7, 0x57

    const/16 v8, 0x58

    const/16 v9, 0x56

    invoke-direct {v1, v7, v8, v9, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v7, 0x25

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v7, 0x58

    const/16 v8, 0x59

    invoke-direct {v1, v7, v8, v6, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v7, 0x26

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v7, 0xa

    const/16 v8, 0xe

    invoke-direct {v1, v7, v8, v4, v10}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v7, 0x27

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v7, 0x2b

    const/16 v8, 0x2d

    invoke-direct {v1, v7, v8, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v7, 0x28

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v7, 0x49

    const/16 v8, 0x4a

    invoke-direct {v1, v7, v8, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v7, 0x29

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v7, 0x61

    const/16 v8, 0x61

    invoke-direct {v1, v7, v8, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v7, 0x2a

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v7, 0xf

    invoke-direct {v1, v7, v12, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v7, 0x2b

    aput-object v1, v0, v7

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v10, v10, v4, v13}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x2c

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v6, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x2d

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v5, v5, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x2e

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v4, 0x1d

    const/16 v6, 0x1d

    invoke-direct {v1, v4, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x2f

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v4, 0x39

    const/16 v6, 0x39

    invoke-direct {v1, v4, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x30

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v4, 0x25

    const/16 v6, 0x26

    invoke-direct {v1, v4, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x31

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v4, 0x4b

    const/16 v6, 0x4f

    const/16 v7, 0x57

    const/16 v8, 0x58

    invoke-direct {v1, v4, v6, v7, v8}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x32

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v4, 0x54

    const/16 v6, 0x54

    invoke-direct {v1, v4, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x33

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v4, 0x16

    invoke-direct {v1, v4, v2, v11, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x34

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    invoke-direct {v1, v10, v13, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x35

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/4 v4, 0x5

    invoke-direct {v1, v4, v4, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x36

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v4, 0x62

    const/16 v6, 0x63

    invoke-direct {v1, v4, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    aput-object v1, v0, v14

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v4, 0x35

    const/16 v6, 0x36

    invoke-direct {v1, v4, v6, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v4, 0x38

    aput-object v1, v0, v4

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v4, 0x1a

    invoke-direct {v1, v2, v4, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x39

    aput-object v1, v0, v2

    new-instance v1, Landroid/support/v4/text/util/FindAddress$ZipRange;

    const/16 v2, 0x52

    const/16 v4, 0x53

    invoke-direct {v1, v2, v4, v3, v3}, Landroid/support/v4/text/util/FindAddress$ZipRange;-><init>(IIII)V

    const/16 v2, 0x3a

    aput-object v1, v0, v2

    sput-object v0, Landroid/support/v4/text/util/FindAddress;->sStateZipCodeRanges:[Landroid/support/v4/text/util/FindAddress$ZipRange;

    const-string v0, "[^,*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]+(?=[,*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]|$)"

    invoke-static {v0, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/support/v4/text/util/FindAddress;->sWordRe:Ljava/util/regex/Pattern;

    const-string v0, "(?:one|\\d+([a-z](?=[^a-z]|$)|st|nd|rd|th)?)(?:-(?:one|\\d+([a-z](?=[^a-z]|$)|st|nd|rd|th)?))*(?=[,\"\'\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]|$)"

    invoke-static {v0, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/support/v4/text/util/FindAddress;->sHouseNumberRe:Ljava/util/regex/Pattern;

    const-string v0, "(?:(ak|alaska)|(al|alabama)|(ar|arkansas)|(as|american[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+samoa)|(az|arizona)|(ca|california)|(co|colorado)|(ct|connecticut)|(dc|district[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+of[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+columbia)|(de|delaware)|(fl|florida)|(fm|federated[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+states[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+of[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+micronesia)|(ga|georgia)|(gu|guam)|(hi|hawaii)|(ia|iowa)|(id|idaho)|(il|illinois)|(in|indiana)|(ks|kansas)|(ky|kentucky)|(la|louisiana)|(ma|massachusetts)|(md|maryland)|(me|maine)|(mh|marshall[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+islands)|(mi|michigan)|(mn|minnesota)|(mo|missouri)|(mp|northern[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+mariana[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+islands)|(ms|mississippi)|(mt|montana)|(nc|north[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+carolina)|(nd|north[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+dakota)|(ne|nebraska)|(nh|new[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+hampshire)|(nj|new[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+jersey)|(nm|new[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+mexico)|(nv|nevada)|(ny|new[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+york)|(oh|ohio)|(ok|oklahoma)|(or|oregon)|(pa|pennsylvania)|(pr|puerto[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+rico)|(pw|palau)|(ri|rhode[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+island)|(sc|south[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+carolina)|(sd|south[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+dakota)|(tn|tennessee)|(tx|texas)|(ut|utah)|(va|virginia)|(vi|virgin[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+islands)|(vt|vermont)|(wa|washington)|(wi|wisconsin)|(wv|west[\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000]+virginia)|(wy|wyoming))(?=[,*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]|$)"

    invoke-static {v0, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/support/v4/text/util/FindAddress;->sStateRe:Ljava/util/regex/Pattern;

    const-string v0, "(?:alley|annex|arcade|ave[.]?|avenue|alameda|bayou|beach|bend|bluffs?|bottom|boulevard|branch|bridge|brooks?|burgs?|bypass|broadway|camino|camp|canyon|cape|causeway|centers?|circles?|cliffs?|club|common|corners?|course|courts?|coves?|creek|crescent|crest|crossing|crossroad|curve|circulo|dale|dam|divide|drives?|estates?|expressway|extensions?|falls?|ferry|fields?|flats?|fords?|forest|forges?|forks?|fort|freeway|gardens?|gateway|glens?|greens?|groves?|harbors?|haven|heights|highway|hills?|hollow|inlet|islands?|isle|junctions?|keys?|knolls?|lakes?|land|landing|lane|lights?|loaf|locks?|lodge|loop|mall|manors?|meadows?|mews|mills?|mission|motorway|mount|mountains?|neck|orchard|oval|overpass|parks?|parkways?|pass|passage|path|pike|pines?|plains?|plaza|points?|ports?|prairie|privada|radial|ramp|ranch|rapids?|rd[.]?|rest|ridges?|river|roads?|route|row|rue|run|shoals?|shores?|skyway|springs?|spurs?|squares?|station|stravenue|stream|st[.]?|streets?|summit|speedway|terrace|throughway|trace|track|trafficway|trail|tunnel|turnpike|underpass|unions?|valleys?|viaduct|views?|villages?|ville|vista|walks?|wall|ways?|wells?|xing|xrd)(?=[,*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]|$)"

    invoke-static {v0, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/support/v4/text/util/FindAddress;->sLocationNameRe:Ljava/util/regex/Pattern;

    const-string v0, "(\\d+)(st|nd|rd|th)"

    invoke-static {v0, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/support/v4/text/util/FindAddress;->sSuffixedNumberRe:Ljava/util/regex/Pattern;

    const-string v0, "(?:\\d{5}(?:-\\d{4})?)(?=[,*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029]|$)"

    invoke-static {v0, v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Landroid/support/v4/text/util/FindAddress;->sZipCodeRe:Ljava/util/regex/Pattern;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static attemptMatch(Ljava/lang/String;Ljava/util/regex/MatchResult;)I
    .registers 15

    invoke-interface {p1}, Ljava/util/regex/MatchResult;->end()I

    move-result p1

    const-string v0, ""

    sget-object v1, Landroid/support/v4/text/util/FindAddress;->sWordRe:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    move-object v9, v0

    const/4 v0, 0x1

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/4 v7, -0x1

    const/4 v8, 0x0

    const/4 v10, -0x1

    :goto_16
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v11

    if-ge p1, v11, :cond_d8

    invoke-virtual {v1, p1}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v11

    if-nez v11, :cond_28

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    neg-int p0, p0

    return p0

    :cond_28
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result v11

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v12

    sub-int/2addr v11, v12

    const/16 v12, 0x19

    if-le v11, v12, :cond_3b

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result p0

    neg-int p0, p0

    return p0

    :cond_3b
    :goto_3b
    invoke-virtual {v1}, Ljava/util/regex/Matcher;->start()I

    move-result v11

    if-ge p1, v11, :cond_53

    const-string v11, "\n\u000b\u000c\r\u0085\u2028\u2029"

    add-int/lit8 v12, p1, 0x1

    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result p1

    invoke-virtual {v11, p1}, Ljava/lang/String;->indexOf(I)I

    move-result p1

    if-eq p1, v2, :cond_51

    add-int/lit8 v0, v0, 0x1

    :cond_51
    move p1, v12

    goto :goto_3b

    :cond_53
    const/4 v11, 0x5

    if-le v0, v11, :cond_58

    goto/16 :goto_d8

    :cond_58
    add-int/2addr v5, v4

    const/16 v12, 0xe

    if-le v5, v12, :cond_5f

    goto/16 :goto_d8

    :cond_5f
    invoke-static {p0, p1}, Landroid/support/v4/text/util/FindAddress;->matchHouseNumber(Ljava/lang/String;I)Ljava/util/regex/MatchResult;

    move-result-object v12

    if-eqz v12, :cond_6f

    if-eqz v6, :cond_6b

    if-le v0, v4, :cond_6b

    neg-int p0, p1

    return p0

    :cond_6b
    if-ne v7, v2, :cond_ce

    move v7, p1

    goto :goto_ce

    :cond_6f
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/support/v4/text/util/FindAddress;->isValidLocationName(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_7c

    const/4 v6, 0x0

    const/4 v8, 0x1

    goto :goto_ce

    :cond_7c
    if-ne v5, v11, :cond_85

    if-nez v8, :cond_85

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result p1

    goto :goto_d8

    :cond_85
    if-eqz v8, :cond_cd

    const/4 v6, 0x4

    if-le v5, v6, :cond_cd

    invoke-static {p0, p1}, Landroid/support/v4/text/util/FindAddress;->matchState(Ljava/lang/String;I)Ljava/util/regex/MatchResult;

    move-result-object p1

    if-eqz p1, :cond_cd

    const-string v6, "et"

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a9

    invoke-interface {p1, v3}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object v6

    const-string v9, "al"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a9

    invoke-interface {p1}, Ljava/util/regex/MatchResult;->end()I

    move-result p1

    goto :goto_d8

    :cond_a9
    sget-object v6, Landroid/support/v4/text/util/FindAddress;->sWordRe:Ljava/util/regex/Pattern;

    invoke-virtual {v6, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v6

    invoke-interface {p1}, Ljava/util/regex/MatchResult;->end()I

    move-result v9

    invoke-virtual {v6, v9}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v9

    if-eqz v9, :cond_c8

    invoke-virtual {v6, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9, p1}, Landroid/support/v4/text/util/FindAddress;->isValidZipCode(Ljava/lang/String;Ljava/util/regex/MatchResult;)Z

    move-result p1

    if-eqz p1, :cond_cd

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->end()I

    move-result p0

    return p0

    :cond_c8
    invoke-interface {p1}, Ljava/util/regex/MatchResult;->end()I

    move-result p1

    move v10, p1

    :cond_cd
    const/4 v6, 0x0

    :cond_ce
    :goto_ce
    invoke-virtual {v1, v3}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->end()I

    move-result p1

    goto/16 :goto_16

    :cond_d8
    :goto_d8
    if-lez v10, :cond_db

    return v10

    :cond_db
    if-lez v7, :cond_de

    move p1, v7

    :cond_de
    neg-int p0, p1

    return p0
.end method

.method private static checkHouseNumber(Ljava/lang/String;)Z
    .registers 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_3
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v1, v3, :cond_18

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    move-result v3

    if-eqz v3, :cond_15

    add-int/lit8 v2, v2, 0x1

    :cond_15
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_18
    const/4 v1, 0x5

    if-le v2, v1, :cond_1c

    return v0

    :cond_1c
    sget-object v1, Landroid/support/v4/text/util/FindAddress;->sSuffixedNumberRe:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_7d

    invoke-virtual {p0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_34

    return v0

    :cond_34
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    rem-int/lit8 v0, v1, 0xa

    packed-switch v0, :pswitch_data_7e

    const-string v0, "th"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_4d
    rem-int/lit8 v1, v1, 0x64

    const/16 v0, 0xd

    if-ne v1, v0, :cond_56

    const-string v0, "th"

    goto :goto_58

    :cond_56
    const-string v0, "rd"

    :goto_58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_5d
    rem-int/lit8 v1, v1, 0x64

    const/16 v0, 0xc

    if-ne v1, v0, :cond_66

    const-string v0, "th"

    goto :goto_68

    :cond_66
    const-string v0, "nd"

    :goto_68
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :pswitch_6d
    rem-int/lit8 v1, v1, 0x64

    const/16 v0, 0xb

    if-ne v1, v0, :cond_76

    const-string v0, "th"

    goto :goto_78

    :cond_76
    const-string v0, "st"

    :goto_78
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_7d
    return v2

    :pswitch_data_7e
    .packed-switch 0x1
        :pswitch_6d
        :pswitch_5d
        :pswitch_4d
    .end packed-switch
.end method

.method static findAddress(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    sget-object v0, Landroid/support/v4/text/util/FindAddress;->sHouseNumberRe:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->find(I)Z

    move-result v2

    if-eqz v2, :cond_2e

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/text/util/FindAddress;->checkHouseNumber(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_29

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    move-result v2

    invoke-static {p0, v0}, Landroid/support/v4/text/util/FindAddress;->attemptMatch(Ljava/lang/String;Ljava/util/regex/MatchResult;)I

    move-result v3

    if-lez v3, :cond_27

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_27
    neg-int v2, v3

    goto :goto_8

    :cond_29
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    move-result v2

    goto :goto_8

    :cond_2e
    const/4 p0, 0x0

    return-object p0
.end method

.method public static isValidLocationName(Ljava/lang/String;)Z
    .registers 2
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    sget-object v0, Landroid/support/v4/text/util/FindAddress;->sLocationNameRe:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    return p0
.end method

.method public static isValidZipCode(Ljava/lang/String;)Z
    .registers 2
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    sget-object v0, Landroid/support/v4/text/util/FindAddress;->sZipCodeRe:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    move-result p0

    return p0
.end method

.method public static isValidZipCode(Ljava/lang/String;Ljava/lang/String;)Z
    .registers 3
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    const/4 v0, 0x0

    invoke-static {p1, v0}, Landroid/support/v4/text/util/FindAddress;->matchState(Ljava/lang/String;I)Ljava/util/regex/MatchResult;

    move-result-object p1

    invoke-static {p0, p1}, Landroid/support/v4/text/util/FindAddress;->isValidZipCode(Ljava/lang/String;Ljava/util/regex/MatchResult;)Z

    move-result p0

    return p0
.end method

.method private static isValidZipCode(Ljava/lang/String;Ljava/util/regex/MatchResult;)Z
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    :cond_4
    invoke-interface {p1}, Ljava/util/regex/MatchResult;->groupCount()I

    move-result v1

    :goto_8
    if-lez v1, :cond_16

    add-int/lit8 v2, v1, -0x1

    invoke-interface {p1, v1}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_14

    move v1, v2

    goto :goto_16

    :cond_14
    move v1, v2

    goto :goto_8

    :cond_16
    :goto_16
    sget-object p1, Landroid/support/v4/text/util/FindAddress;->sZipCodeRe:Ljava/util/regex/Pattern;

    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result p1

    if-eqz p1, :cond_2d

    sget-object p1, Landroid/support/v4/text/util/FindAddress;->sStateZipCodeRanges:[Landroid/support/v4/text/util/FindAddress$ZipRange;

    aget-object p1, p1, v1

    invoke-virtual {p1, p0}, Landroid/support/v4/text/util/FindAddress$ZipRange;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2d

    const/4 v0, 0x1

    :cond_2d
    return v0
.end method

.method public static matchHouseNumber(Ljava/lang/String;I)Ljava/util/regex/MatchResult;
    .registers 5
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    const/4 v0, 0x0

    if-lez p1, :cond_13

    const-string v1, ":,\"\'\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_13

    return-object v0

    :cond_13
    sget-object v1, Landroid/support/v4/text/util/FindAddress;->sHouseNumberRe:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {v1, p1, p0}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result p1

    if-eqz p1, :cond_37

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    move-result-object p0

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Ljava/util/regex/MatchResult;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/support/v4/text/util/FindAddress;->checkHouseNumber(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_37

    return-object p0

    :cond_37
    return-object v0
.end method

.method public static matchState(Ljava/lang/String;I)Ljava/util/regex/MatchResult;
    .registers 5
    .annotation build Landroid/support/annotation/VisibleForTesting;
    .end annotation

    const/4 v0, 0x0

    if-lez p1, :cond_13

    const-string v1, ",*\u2022\t \u00a0\u1680\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000\n\u000b\u000c\r\u0085\u2028\u2029"

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    const/4 v2, -0x1

    if-ne v1, v2, :cond_13

    return-object v0

    :cond_13
    sget-object v1, Landroid/support/v4/text/util/FindAddress;->sStateRe:Ljava/util/regex/Pattern;

    invoke-virtual {v1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-virtual {v1, p1, p0}, Ljava/util/regex/Matcher;->region(II)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->lookingAt()Z

    move-result p1

    if-eqz p1, :cond_2b

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->toMatchResult()Ljava/util/regex/MatchResult;

    move-result-object v0

    :cond_2b
    return-object v0
.end method
