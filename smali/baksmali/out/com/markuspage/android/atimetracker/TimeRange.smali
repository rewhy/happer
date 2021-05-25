.class public Lcom/markuspage/android/atimetracker/TimeRange;
.super Ljava/lang/Object;
.source "TimeRange.java"

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable<",
        "Lcom/markuspage/android/atimetracker/TimeRange;",
        ">;"
    }
.end annotation


# static fields
.field private static final FIELDS:[I

.field protected static FORMAT:Ljava/text/DateFormat; = null

.field public static final NULL:J = -0x1L


# instance fields
.field private end:J

.field private start:J


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_12

    sput-object v0, Lcom/markuspage/android/atimetracker/TimeRange;->FIELDS:[I

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "HH:mm"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/markuspage/android/atimetracker/TimeRange;->FORMAT:Ljava/text/DateFormat;

    return-void

    :array_12
    .array-data 4
        0xb
        0xc
        0xd
        0xe
    .end array-data
.end method

.method public constructor <init>(JJ)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    iput-wide p3, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    return-void
.end method

.method public static overlap(Ljava/util/Calendar;JJ)J
    .registers 10

    sget-object v0, Lcom/markuspage/android/atimetracker/TimeRange;->FIELDS:[I

    array-length v1, v0

    const/4 v2, 0x0

    :goto_4
    if-ge v2, v1, :cond_12

    aget v3, v0, v2

    invoke-virtual {p0, v3}, Ljava/util/Calendar;->getMinimum(I)I

    move-result v4

    invoke-virtual {p0, v3, v4}, Ljava/util/Calendar;->set(II)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    :cond_12
    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v0

    const/4 v2, 0x5

    const/4 v3, 0x1

    invoke-virtual {p0, v2, v3}, Ljava/util/Calendar;->add(II)V

    invoke-virtual {p0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v2

    cmp-long p0, v2, p1

    if-ltz p0, :cond_3d

    cmp-long p0, p3, v0

    if-gez p0, :cond_30

    goto :goto_3d

    :cond_30
    cmp-long p0, v0, p1

    if-lez p0, :cond_35

    move-wide p1, v0

    :cond_35
    cmp-long p0, v2, p3

    if-gez p0, :cond_3a

    move-wide p3, v2

    :cond_3a
    const/4 p0, 0x0

    sub-long/2addr p3, p1

    return-wide p3

    :cond_3d
    :goto_3d
    const-wide/16 p0, 0x0

    return-wide p0
.end method


# virtual methods
.method public compareTo(Lcom/markuspage/android/atimetracker/TimeRange;)I
    .registers 9

    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    iget-wide v2, p1, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    const/4 v4, -0x1

    cmp-long v5, v0, v2

    if-gez v5, :cond_a

    return v4

    :cond_a
    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    iget-wide v2, p1, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    const/4 v5, 0x1

    cmp-long v6, v0, v2

    if-lez v6, :cond_14

    return v5

    :cond_14
    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    const-wide/16 v2, -0x1

    cmp-long v6, v0, v2

    if-nez v6, :cond_1d

    return v5

    :cond_1d
    iget-wide v0, p1, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    cmp-long v6, v0, v2

    if-nez v6, :cond_24

    return v4

    :cond_24
    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    iget-wide v2, p1, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    cmp-long v6, v0, v2

    if-gez v6, :cond_2d

    return v4

    :cond_2d
    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    iget-wide v2, p1, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    cmp-long p1, v0, v2

    if-lez p1, :cond_36

    return v5

    :cond_36
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    check-cast p1, Lcom/markuspage/android/atimetracker/TimeRange;

    invoke-virtual {p0, p1}, Lcom/markuspage/android/atimetracker/TimeRange;->compareTo(Lcom/markuspage/android/atimetracker/TimeRange;)I

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 8

    instance-of v0, p1, Lcom/markuspage/android/atimetracker/TimeRange;

    const/4 v1, 0x0

    if-eqz v0, :cond_19

    check-cast p1, Lcom/markuspage/android/atimetracker/TimeRange;

    iget-wide v2, p1, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    iget-wide v4, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_18

    iget-wide v2, p1, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    iget-wide v4, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    cmp-long p1, v2, v4

    if-nez p1, :cond_18

    const/4 v1, 0x1

    :cond_18
    return v1

    :cond_19
    return v1
.end method

.method public getEnd()J
    .registers 3

    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    return-wide v0
.end method

.method public getStart()J
    .registers 3

    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    return-wide v0
.end method

.method public getTotal()J
    .registers 6

    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    const-wide/16 v2, -0x1

    cmp-long v4, v0, v2

    if-nez v4, :cond_10

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    sub-long/2addr v0, v2

    return-wide v0

    :cond_10
    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    iget-wide v2, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public hashCode()I
    .registers 7

    iget-wide v0, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    iget-wide v2, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    const-wide/16 v4, 0x65

    mul-long v2, v2, v4

    add-long/2addr v0, v2

    long-to-int v0, v0

    return v0
.end method

.method public setEnd(J)V
    .registers 3

    iput-wide p1, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    return-void
.end method

.method public setStart(J)V
    .registers 3

    iput-wide p1, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    new-instance v0, Ljava/util/Date;

    iget-wide v1, p0, Lcom/markuspage/android/atimetracker/TimeRange;->start:J

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    new-instance v1, Ljava/lang/StringBuilder;

    sget-object v2, Lcom/markuspage/android/atimetracker/TimeRange;->FORMAT:Ljava/text/DateFormat;

    invoke-virtual {v2, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, " - "

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    const-wide/16 v4, -0x1

    cmp-long v0, v2, v4

    if-eqz v0, :cond_30

    sget-object v0, Lcom/markuspage/android/atimetracker/TimeRange;->FORMAT:Ljava/text/DateFormat;

    new-instance v2, Ljava/util/Date;

    iget-wide v3, p0, Lcom/markuspage/android/atimetracker/TimeRange;->end:J

    invoke-direct {v2, v3, v4}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v0, v2}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_35

    :cond_30
    const-string v0, "..."

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :goto_35
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
