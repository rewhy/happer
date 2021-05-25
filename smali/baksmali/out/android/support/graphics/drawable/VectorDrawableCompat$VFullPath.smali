.class Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;
.super Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;
.source "VectorDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/graphics/drawable/VectorDrawableCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VFullPath"
.end annotation


# static fields
.field private static final FILL_TYPE_WINDING:I


# instance fields
.field mFillAlpha:F

.field mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

.field mFillRule:I

.field mStrokeAlpha:F

.field mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

.field mStrokeLineCap:Landroid/graphics/Paint$Cap;

.field mStrokeLineJoin:Landroid/graphics/Paint$Join;

.field mStrokeMiterlimit:F

.field mStrokeWidth:F

.field private mThemeAttrs:[I

.field mTrimPathEnd:F

.field mTrimPathOffset:F

.field mTrimPathStart:F


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeWidth:F

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    const/4 v2, 0x0

    iput v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillRule:I

    iput v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    iput v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineCap:Landroid/graphics/Paint$Cap;

    sget-object v0, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineJoin:Landroid/graphics/Paint$Join;

    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeMiterlimit:F

    return-void
.end method

.method public constructor <init>(Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;)V
    .registers 5

    invoke-direct {p0, p1}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;-><init>(Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;)V

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeWidth:F

    const/high16 v1, 0x3f800000    # 1.0f

    iput v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    const/4 v2, 0x0

    iput v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillRule:I

    iput v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    iput v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineCap:Landroid/graphics/Paint$Cap;

    sget-object v0, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineJoin:Landroid/graphics/Paint$Join;

    const/high16 v0, 0x40800000    # 4.0f

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeMiterlimit:F

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mThemeAttrs:[I

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mThemeAttrs:[I

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeWidth:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeWidth:F

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillRule:I

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillRule:I

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineCap:Landroid/graphics/Paint$Cap;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineCap:Landroid/graphics/Paint$Cap;

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineJoin:Landroid/graphics/Paint$Join;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineJoin:Landroid/graphics/Paint$Join;

    iget p1, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeMiterlimit:F

    iput p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeMiterlimit:F

    return-void
.end method

.method private getStrokeLineCap(ILandroid/graphics/Paint$Cap;)Landroid/graphics/Paint$Cap;
    .registers 3

    packed-switch p1, :pswitch_data_e

    return-object p2

    :pswitch_4
    sget-object p1, Landroid/graphics/Paint$Cap;->SQUARE:Landroid/graphics/Paint$Cap;

    return-object p1

    :pswitch_7
    sget-object p1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    return-object p1

    :pswitch_a
    sget-object p1, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    return-object p1

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
        :pswitch_7
        :pswitch_4
    .end packed-switch
.end method

.method private getStrokeLineJoin(ILandroid/graphics/Paint$Join;)Landroid/graphics/Paint$Join;
    .registers 3

    packed-switch p1, :pswitch_data_e

    return-object p2

    :pswitch_4
    sget-object p1, Landroid/graphics/Paint$Join;->BEVEL:Landroid/graphics/Paint$Join;

    return-object p1

    :pswitch_7
    sget-object p1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    return-object p1

    :pswitch_a
    sget-object p1, Landroid/graphics/Paint$Join;->MITER:Landroid/graphics/Paint$Join;

    return-object p1

    nop

    :pswitch_data_e
    .packed-switch 0x0
        :pswitch_a
        :pswitch_7
        :pswitch_4
    .end packed-switch
.end method

.method private updateStateFromTypedArray(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;)V
    .registers 11

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mThemeAttrs:[I

    const-string v0, "pathData"

    invoke-static {p2, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->hasAttribute(Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_c

    return-void

    :cond_c
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_15

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mPathName:Ljava/lang/String;

    :cond_15
    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_22

    invoke-static {v0}, Landroid/support/v4/graphics/PathParser;->createNodesFromPathData(Ljava/lang/String;)[Landroid/support/v4/graphics/PathParser$PathDataNode;

    move-result-object v0

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mNodes:[Landroid/support/v4/graphics/PathParser$PathDataNode;

    :cond_22
    const-string v4, "fillColor"

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    invoke-static/range {v1 .. v6}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedComplexColor(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;Ljava/lang/String;II)Landroid/support/v4/content/res/ComplexColorCompat;

    move-result-object v0

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

    const-string v0, "fillAlpha"

    const/16 v1, 0xc

    iget v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    invoke-static {p1, p2, v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result v0

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    const-string v0, "strokeLineCap"

    const/16 v1, 0x8

    const/4 v2, -0x1

    invoke-static {p1, p2, v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v0

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineCap:Landroid/graphics/Paint$Cap;

    invoke-direct {p0, v0, v1}, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->getStrokeLineCap(ILandroid/graphics/Paint$Cap;)Landroid/graphics/Paint$Cap;

    move-result-object v0

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineCap:Landroid/graphics/Paint$Cap;

    const-string v0, "strokeLineJoin"

    const/16 v1, 0x9

    invoke-static {p1, p2, v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result v0

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineJoin:Landroid/graphics/Paint$Join;

    invoke-direct {p0, v0, v1}, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->getStrokeLineJoin(ILandroid/graphics/Paint$Join;)Landroid/graphics/Paint$Join;

    move-result-object v0

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineJoin:Landroid/graphics/Paint$Join;

    const-string v0, "strokeMiterLimit"

    const/16 v1, 0xa

    iget v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeMiterlimit:F

    invoke-static {p1, p2, v0, v1, v2}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result v0

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeMiterlimit:F

    const-string v4, "strokeColor"

    const/4 v5, 0x3

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v1 .. v6}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedComplexColor(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;Ljava/lang/String;II)Landroid/support/v4/content/res/ComplexColorCompat;

    move-result-object p3

    iput-object p3, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

    const-string p3, "strokeAlpha"

    const/16 v0, 0xb

    iget v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    invoke-static {p1, p2, p3, v0, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p3

    iput p3, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    const-string p3, "strokeWidth"

    const/4 v0, 0x4

    iget v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeWidth:F

    invoke-static {p1, p2, p3, v0, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p3

    iput p3, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeWidth:F

    const-string p3, "trimPathEnd"

    const/4 v0, 0x6

    iget v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    invoke-static {p1, p2, p3, v0, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p3

    iput p3, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    const-string p3, "trimPathOffset"

    const/4 v0, 0x7

    iget v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    invoke-static {p1, p2, p3, v0, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p3

    iput p3, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    const-string p3, "trimPathStart"

    const/4 v0, 0x5

    iget v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    invoke-static {p1, p2, p3, v0, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedFloat(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;IF)F

    move-result p3

    iput p3, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    const-string p3, "fillType"

    const/16 v0, 0xd

    iget v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillRule:I

    invoke-static {p1, p2, p3, v0, v1}, Landroid/support/v4/content/res/TypedArrayUtils;->getNamedInt(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Ljava/lang/String;II)I

    move-result p1

    iput p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillRule:I

    return-void
.end method


# virtual methods
.method public applyTheme(Landroid/content/res/Resources$Theme;)V
    .registers 2

    iget-object p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mThemeAttrs:[I

    if-nez p1, :cond_5

    return-void

    :cond_5
    return-void
.end method

.method public canApplyTheme()Z
    .registers 2

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mThemeAttrs:[I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method getFillAlpha()F
    .registers 2

    iget v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    return v0
.end method

.method getFillColor()I
    .registers 2
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {v0}, Landroid/support/v4/content/res/ComplexColorCompat;->getColor()I

    move-result v0

    return v0
.end method

.method getStrokeAlpha()F
    .registers 2

    iget v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    return v0
.end method

.method getStrokeColor()I
    .registers 2
    .annotation build Landroid/support/annotation/ColorInt;
    .end annotation

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {v0}, Landroid/support/v4/content/res/ComplexColorCompat;->getColor()I

    move-result v0

    return v0
.end method

.method getStrokeWidth()F
    .registers 2

    iget v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeWidth:F

    return v0
.end method

.method getTrimPathEnd()F
    .registers 2

    iget v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    return v0
.end method

.method getTrimPathOffset()F
    .registers 2

    iget v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    return v0
.end method

.method getTrimPathStart()F
    .registers 2

    iget v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    return v0
.end method

.method public inflate(Landroid/content/res/Resources;Landroid/util/AttributeSet;Landroid/content/res/Resources$Theme;Lorg/xmlpull/v1/XmlPullParser;)V
    .registers 6

    sget-object v0, Landroid/support/graphics/drawable/AndroidResources;->STYLEABLE_VECTOR_DRAWABLE_PATH:[I

    invoke-static {p1, p3, p2, v0}, Landroid/support/v4/content/res/TypedArrayUtils;->obtainAttributes(Landroid/content/res/Resources;Landroid/content/res/Resources$Theme;Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    invoke-direct {p0, p1, p4, p3}, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->updateStateFromTypedArray(Landroid/content/res/TypedArray;Lorg/xmlpull/v1/XmlPullParser;Landroid/content/res/Resources$Theme;)V

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public isStateful()Z
    .registers 2

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {v0}, Landroid/support/v4/content/res/ComplexColorCompat;->isStateful()Z

    move-result v0

    if-nez v0, :cond_13

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {v0}, Landroid/support/v4/content/res/ComplexColorCompat;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_13

    :cond_11
    const/4 v0, 0x0

    goto :goto_14

    :cond_13
    :goto_13
    const/4 v0, 0x1

    :goto_14
    return v0
.end method

.method public onStateChanged([I)Z
    .registers 4

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/content/res/ComplexColorCompat;->onStateChanged([I)Z

    move-result v0

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {v1, p1}, Landroid/support/v4/content/res/ComplexColorCompat;->onStateChanged([I)Z

    move-result p1

    or-int/2addr p1, v0

    return p1
.end method

.method setFillAlpha(F)V
    .registers 2

    iput p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    return-void
.end method

.method setFillColor(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/content/res/ComplexColorCompat;->setColor(I)V

    return-void
.end method

.method setStrokeAlpha(F)V
    .registers 2

    iput p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    return-void
.end method

.method setStrokeColor(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/content/res/ComplexColorCompat;->setColor(I)V

    return-void
.end method

.method setStrokeWidth(F)V
    .registers 2

    iput p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeWidth:F

    return-void
.end method

.method setTrimPathEnd(F)V
    .registers 2

    iput p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    return-void
.end method

.method setTrimPathOffset(F)V
    .registers 2

    iput p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    return-void
.end method

.method setTrimPathStart(F)V
    .registers 2

    iput p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    return-void
.end method
