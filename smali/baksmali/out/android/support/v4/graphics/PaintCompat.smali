.class public final Landroid/support/v4/graphics/PaintCompat;
.super Ljava/lang/Object;
.source "PaintCompat.java"


# static fields
.field private static final EM_STRING:Ljava/lang/String; = "m"

.field private static final TOFU_STRING:Ljava/lang/String; = "\udb3f\udffd"

.field private static final sRectThreadLocal:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/support/v4/util/Pair<",
            "Landroid/graphics/Rect;",
            "Landroid/graphics/Rect;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Landroid/support/v4/graphics/PaintCompat;->sRectThreadLocal:Ljava/lang/ThreadLocal;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static hasGlyph(Landroid/graphics/Paint;Ljava/lang/String;)Z
    .registers 10
    .param p0    # Landroid/graphics/Paint;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->hasGlyph(Ljava/lang/String;)Z

    move-result p0

    return p0

    :cond_b
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_1e

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v3

    if-eqz v3, :cond_1e

    return v1

    :cond_1e
    const-string v3, "\udb3f\udffd"

    invoke-virtual {p0, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    const-string v4, "m"

    invoke-virtual {p0, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v4

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v5

    const/4 v6, 0x0

    cmpl-float v7, v5, v6

    if-nez v7, :cond_34

    return v2

    :cond_34
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v7

    invoke-virtual {p1, v2, v7}, Ljava/lang/String;->codePointCount(II)I

    move-result v7

    if-le v7, v1, :cond_5f

    const/high16 v7, 0x40000000    # 2.0f

    mul-float v4, v4, v7

    cmpl-float v4, v5, v4

    if-lez v4, :cond_47

    return v2

    :cond_47
    const/4 v4, 0x0

    :goto_48
    if-ge v4, v0, :cond_5a

    invoke-virtual {p1, v4}, Ljava/lang/String;->codePointAt(I)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Character;->charCount(I)I

    move-result v7

    add-int/2addr v7, v4

    invoke-virtual {p0, p1, v4, v7}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    move-result v4

    add-float/2addr v6, v4

    move v4, v7

    goto :goto_48

    :cond_5a
    cmpl-float v4, v5, v6

    if-ltz v4, :cond_5f

    return v2

    :cond_5f
    cmpl-float v3, v5, v3

    if-eqz v3, :cond_64

    return v1

    :cond_64
    invoke-static {}, Landroid/support/v4/graphics/PaintCompat;->obtainEmptyRects()Landroid/support/v4/util/Pair;

    move-result-object v3

    const-string v4, "\udb3f\udffd"

    const-string v5, "\udb3f\udffd"

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    iget-object v6, v3, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v6, Landroid/graphics/Rect;

    invoke-virtual {p0, v4, v2, v5, v6}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget-object v4, v3, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v4, Landroid/graphics/Rect;

    invoke-virtual {p0, p1, v2, v0, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    iget-object p0, v3, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast p0, Landroid/graphics/Rect;

    iget-object p1, v3, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    invoke-virtual {p0, p1}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr p0, v1

    return p0
.end method

.method private static obtainEmptyRects()Landroid/support/v4/util/Pair;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/support/v4/util/Pair<",
            "Landroid/graphics/Rect;",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    sget-object v0, Landroid/support/v4/graphics/PaintCompat;->sRectThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/util/Pair;

    if-nez v0, :cond_1f

    new-instance v0, Landroid/support/v4/util/Pair;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    invoke-direct {v0, v1, v2}, Landroid/support/v4/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    sget-object v1, Landroid/support/v4/graphics/PaintCompat;->sRectThreadLocal:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    goto :goto_2d

    :cond_1f
    iget-object v1, v0, Landroid/support/v4/util/Pair;->first:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    iget-object v1, v0, Landroid/support/v4/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->setEmpty()V

    :goto_2d
    return-object v0
.end method
