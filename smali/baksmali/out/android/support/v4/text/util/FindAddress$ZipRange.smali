.class Landroid/support/v4/text/util/FindAddress$ZipRange;
.super Ljava/lang/Object;
.source "FindAddress.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/text/util/FindAddress;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ZipRange"
.end annotation


# instance fields
.field mException1:I

.field mException2:I

.field mHigh:I

.field mLow:I


# direct methods
.method constructor <init>(IIII)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Landroid/support/v4/text/util/FindAddress$ZipRange;->mLow:I

    iput p2, p0, Landroid/support/v4/text/util/FindAddress$ZipRange;->mHigh:I

    iput p3, p0, Landroid/support/v4/text/util/FindAddress$ZipRange;->mException1:I

    iput p3, p0, Landroid/support/v4/text/util/FindAddress$ZipRange;->mException2:I

    return-void
.end method


# virtual methods
.method matches(Ljava/lang/String;)Z
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    iget v1, p0, Landroid/support/v4/text/util/FindAddress$ZipRange;->mLow:I

    if-gt v1, p1, :cond_12

    iget v1, p0, Landroid/support/v4/text/util/FindAddress$ZipRange;->mHigh:I

    if-le p1, v1, :cond_1a

    :cond_12
    iget v1, p0, Landroid/support/v4/text/util/FindAddress$ZipRange;->mException1:I

    if-eq p1, v1, :cond_1a

    iget v1, p0, Landroid/support/v4/text/util/FindAddress$ZipRange;->mException2:I

    if-ne p1, v1, :cond_1b

    :cond_1a
    const/4 v0, 0x1

    :cond_1b
    return v0
.end method
