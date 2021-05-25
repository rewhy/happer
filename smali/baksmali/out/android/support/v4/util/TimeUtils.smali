.class public final Landroid/support/v4/util/TimeUtils;
.super Ljava/lang/Object;
.source "TimeUtils.java"


# annotations
.annotation build Landroid/support/annotation/RestrictTo;
    value = {
        .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field public static final HUNDRED_DAY_FIELD_LEN:I = 0x13
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation
.end field

.field private static final SECONDS_PER_DAY:I = 0x15180

.field private static final SECONDS_PER_HOUR:I = 0xe10

.field private static final SECONDS_PER_MINUTE:I = 0x3c

.field private static sFormatStr:[C

.field private static final sFormatSync:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Landroid/support/v4/util/TimeUtils;->sFormatSync:Ljava/lang/Object;

    const/16 v0, 0x18

    new-array v0, v0, [C

    sput-object v0, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static accumField(IIZI)I
    .registers 6

    const/4 v0, 0x3

    const/16 v1, 0x63

    if-gt p0, v1, :cond_20

    if-eqz p2, :cond_a

    if-lt p3, v0, :cond_a

    goto :goto_20

    :cond_a
    const/16 v0, 0x9

    const/4 v1, 0x2

    if-gt p0, v0, :cond_1e

    if-eqz p2, :cond_14

    if-lt p3, v1, :cond_14

    goto :goto_1e

    :cond_14
    if-nez p2, :cond_1b

    if-lez p0, :cond_19

    goto :goto_1b

    :cond_19
    const/4 p0, 0x0

    return p0

    :cond_1b
    :goto_1b
    add-int/lit8 p1, p1, 0x1

    return p1

    :cond_1e
    :goto_1e
    add-int/2addr p1, v1

    return p1

    :cond_20
    :goto_20
    add-int/2addr p1, v0

    return p1
.end method

.method public static formatDuration(JJLjava/io/PrintWriter;)V
    .registers 8
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-nez v2, :cond_c

    const-string p0, "--"

    invoke-virtual {p4, p0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    return-void

    :cond_c
    const/4 v0, 0x0

    sub-long/2addr p0, p2

    const/4 p2, 0x0

    invoke-static {p0, p1, p4, p2}, Landroid/support/v4/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;I)V

    return-void
.end method

.method public static formatDuration(JLjava/io/PrintWriter;)V
    .registers 4
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    const/4 v0, 0x0

    invoke-static {p0, p1, p2, v0}, Landroid/support/v4/util/TimeUtils;->formatDuration(JLjava/io/PrintWriter;I)V

    return-void
.end method

.method public static formatDuration(JLjava/io/PrintWriter;I)V
    .registers 6
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    sget-object v0, Landroid/support/v4/util/TimeUtils;->sFormatSync:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-static {p0, p1, p3}, Landroid/support/v4/util/TimeUtils;->formatDurationLocked(JI)I

    move-result p0

    new-instance p1, Ljava/lang/String;

    sget-object p3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    const/4 v1, 0x0

    invoke-direct {p1, p3, v1, p0}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :catchall_14
    move-exception p0

    monitor-exit v0
    :try_end_16
    .catchall {:try_start_3 .. :try_end_16} :catchall_14

    throw p0
.end method

.method public static formatDuration(JLjava/lang/StringBuilder;)V
    .registers 5
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    sget-object v0, Landroid/support/v4/util/TimeUtils;->sFormatSync:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_4
    invoke-static {p0, p1, v1}, Landroid/support/v4/util/TimeUtils;->formatDurationLocked(JI)I

    move-result p0

    sget-object p1, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    invoke-virtual {p2, p1, v1, p0}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    monitor-exit v0

    return-void

    :catchall_f
    move-exception p0

    monitor-exit v0
    :try_end_11
    .catchall {:try_start_4 .. :try_end_11} :catchall_f

    throw p0
.end method

.method private static formatDurationLocked(JI)I
    .registers 20

    move-wide/from16 v0, p0

    move/from16 v2, p2

    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    array-length v3, v3

    if-ge v3, v2, :cond_d

    new-array v3, v2, [C

    sput-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    :cond_d
    sget-object v3, Landroid/support/v4/util/TimeUtils;->sFormatStr:[C

    const/16 v4, 0x20

    const-wide/16 v5, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x0

    cmp-long v7, v0, v5

    if-nez v7, :cond_25

    add-int/lit8 v0, v2, -0x1

    :goto_1b
    if-lez v0, :cond_20

    aput-char v4, v3, v11

    goto :goto_1b

    :cond_20
    const/16 v0, 0x30

    aput-char v0, v3, v11

    return v10

    :cond_25
    cmp-long v7, v0, v5

    if-lez v7, :cond_2c

    const/16 v5, 0x2b

    goto :goto_2f

    :cond_2c
    const/16 v5, 0x2d

    neg-long v0, v0

    :goto_2f
    const-wide/16 v6, 0x3e8

    rem-long v8, v0, v6

    long-to-int v12, v8

    div-long/2addr v0, v6

    long-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->floor(D)D

    move-result-wide v0

    double-to-int v0, v0

    const v1, 0x15180

    if-le v0, v1, :cond_46

    div-int v6, v0, v1

    mul-int v1, v1, v6

    sub-int/2addr v0, v1

    goto :goto_47

    :cond_46
    const/4 v6, 0x0

    :goto_47
    const/16 v1, 0xe10

    if-le v0, v1, :cond_51

    div-int/lit16 v1, v0, 0xe10

    mul-int/lit16 v7, v1, 0xe10

    sub-int/2addr v0, v7

    goto :goto_52

    :cond_51
    const/4 v1, 0x0

    :goto_52
    const/16 v7, 0x3c

    if-le v0, v7, :cond_5e

    div-int/lit8 v7, v0, 0x3c

    mul-int/lit8 v8, v7, 0x3c

    sub-int/2addr v0, v8

    move v13, v0

    move v0, v7

    goto :goto_60

    :cond_5e
    move v13, v0

    const/4 v0, 0x0

    :goto_60
    const/4 v14, 0x3

    const/4 v15, 0x2

    if-eqz v2, :cond_9b

    invoke-static {v6, v10, v11, v11}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v7

    if-lez v7, :cond_6c

    const/4 v8, 0x1

    goto :goto_6d

    :cond_6c
    const/4 v8, 0x0

    :goto_6d
    invoke-static {v1, v10, v8, v15}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v7, v8

    if-lez v7, :cond_76

    const/4 v8, 0x1

    goto :goto_77

    :cond_76
    const/4 v8, 0x0

    :goto_77
    invoke-static {v0, v10, v8, v15}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v7, v8

    if-lez v7, :cond_80

    const/4 v8, 0x1

    goto :goto_81

    :cond_80
    const/4 v8, 0x0

    :goto_81
    invoke-static {v13, v10, v8, v15}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v7, v8

    if-lez v7, :cond_8a

    const/4 v8, 0x3

    goto :goto_8b

    :cond_8a
    const/4 v8, 0x0

    :goto_8b
    invoke-static {v12, v15, v10, v8}, Landroid/support/v4/util/TimeUtils;->accumField(IIZI)I

    move-result v8

    add-int/2addr v8, v10

    add-int/2addr v7, v8

    const/4 v8, 0x0

    :goto_92
    if-ge v7, v2, :cond_9c

    aput-char v4, v3, v8

    add-int/lit8 v8, v8, 0x1

    add-int/lit8 v7, v7, 0x1

    goto :goto_92

    :cond_9b
    const/4 v8, 0x0

    :cond_9c
    aput-char v5, v3, v8

    add-int/lit8 v9, v8, 0x1

    if-eqz v2, :cond_a4

    const/4 v2, 0x1

    goto :goto_a5

    :cond_a4
    const/4 v2, 0x0

    :goto_a5
    const/16 v7, 0x64

    const/4 v8, 0x0

    const/16 v16, 0x0

    move-object v4, v3

    move v5, v6

    move v6, v7

    move v7, v9

    move v11, v9

    move/from16 v9, v16

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v7

    const/16 v6, 0x68

    if-eq v7, v11, :cond_bb

    const/4 v8, 0x1

    goto :goto_bc

    :cond_bb
    const/4 v8, 0x0

    :goto_bc
    if-eqz v2, :cond_c0

    const/4 v9, 0x2

    goto :goto_c1

    :cond_c0
    const/4 v9, 0x0

    :goto_c1
    move-object v4, v3

    move v5, v1

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v7

    const/16 v6, 0x6d

    if-eq v7, v11, :cond_cd

    const/4 v8, 0x1

    goto :goto_ce

    :cond_cd
    const/4 v8, 0x0

    :goto_ce
    if-eqz v2, :cond_d2

    const/4 v9, 0x2

    goto :goto_d3

    :cond_d2
    const/4 v9, 0x0

    :goto_d3
    move-object v4, v3

    move v5, v0

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v7

    const/16 v6, 0x73

    if-eq v7, v11, :cond_df

    const/4 v8, 0x1

    goto :goto_e0

    :cond_df
    const/4 v8, 0x0

    :goto_e0
    if-eqz v2, :cond_e4

    const/4 v9, 0x2

    goto :goto_e5

    :cond_e4
    const/4 v9, 0x0

    :goto_e5
    move-object v4, v3

    move v5, v13

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v7

    const/16 v6, 0x6d

    const/4 v8, 0x1

    if-eqz v2, :cond_f4

    if-eq v7, v11, :cond_f4

    const/4 v9, 0x3

    goto :goto_f5

    :cond_f4
    const/4 v9, 0x0

    :goto_f5
    move-object v4, v3

    move v5, v12

    invoke-static/range {v4 .. v9}, Landroid/support/v4/util/TimeUtils;->printField([CICIZI)I

    move-result v0

    const/16 v1, 0x73

    aput-char v1, v3, v0

    add-int/2addr v0, v10

    return v0
.end method

.method private static printField([CICIZI)I
    .registers 8

    if-nez p4, :cond_4

    if-lez p1, :cond_3d

    :cond_4
    if-eqz p4, :cond_9

    const/4 v0, 0x3

    if-ge p5, v0, :cond_d

    :cond_9
    const/16 v0, 0x63

    if-le p1, v0, :cond_1a

    :cond_d
    div-int/lit8 v0, p1, 0x64

    add-int/lit8 v1, v0, 0x30

    int-to-char v1, v1

    aput-char v1, p0, p3

    add-int/lit8 v1, p3, 0x1

    mul-int/lit8 v0, v0, 0x64

    sub-int/2addr p1, v0

    goto :goto_1b

    :cond_1a
    move v1, p3

    :goto_1b
    if-eqz p4, :cond_20

    const/4 p4, 0x2

    if-ge p5, p4, :cond_26

    :cond_20
    const/16 p4, 0x9

    if-gt p1, p4, :cond_26

    if-eq p3, v1, :cond_32

    :cond_26
    div-int/lit8 p3, p1, 0xa

    add-int/lit8 p4, p3, 0x30

    int-to-char p4, p4

    aput-char p4, p0, v1

    add-int/lit8 v1, v1, 0x1

    mul-int/lit8 p3, p3, 0xa

    sub-int/2addr p1, p3

    :cond_32
    add-int/lit8 p1, p1, 0x30

    int-to-char p1, p1

    aput-char p1, p0, v1

    add-int/lit8 v1, v1, 0x1

    aput-char p2, p0, v1

    add-int/lit8 p3, v1, 0x1

    :cond_3d
    return p3
.end method
