.class final Landroid/support/v4/text/util/LinkifyCompat$1;
.super Ljava/lang/Object;
.source "LinkifyCompat.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v4/text/util/LinkifyCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;)I
    .registers 7

    iget v0, p1, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;->start:I

    iget v1, p2, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;->start:I

    const/4 v2, -0x1

    if-ge v0, v1, :cond_8

    return v2

    :cond_8
    iget v0, p1, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;->start:I

    iget v1, p2, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;->start:I

    const/4 v3, 0x1

    if-le v0, v1, :cond_10

    return v3

    :cond_10
    iget v0, p1, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;->end:I

    iget v1, p2, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;->end:I

    if-ge v0, v1, :cond_17

    return v3

    :cond_17
    iget p1, p1, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;->end:I

    iget p2, p2, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;->end:I

    if-le p1, p2, :cond_1e

    return v2

    :cond_1e
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .registers 3

    check-cast p1, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;

    check-cast p2, Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/text/util/LinkifyCompat$1;->compare(Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;Landroid/support/v4/text/util/LinkifyCompat$LinkSpec;)I

    move-result p1

    return p1
.end method
