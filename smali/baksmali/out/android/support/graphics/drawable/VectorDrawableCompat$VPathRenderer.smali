.class Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;
.super Ljava/lang/Object;
.source "VectorDrawableCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/graphics/drawable/VectorDrawableCompat;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "VPathRenderer"
.end annotation


# static fields
.field private static final IDENTITY_MATRIX:Landroid/graphics/Matrix;


# instance fields
.field mBaseHeight:F

.field mBaseWidth:F

.field private mChangingConfigurations:I

.field mFillPaint:Landroid/graphics/Paint;

.field private final mFinalPathMatrix:Landroid/graphics/Matrix;

.field mIsStateful:Ljava/lang/Boolean;

.field private final mPath:Landroid/graphics/Path;

.field private mPathMeasure:Landroid/graphics/PathMeasure;

.field private final mRenderPath:Landroid/graphics/Path;

.field mRootAlpha:I

.field final mRootGroup:Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

.field mRootName:Ljava/lang/String;

.field mStrokePaint:Landroid/graphics/Paint;

.field final mVGTargetsMap:Landroid/support/v4/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field mViewportHeight:F

.field mViewportWidth:F


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    sput-object v0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->IDENTITY_MATRIX:Landroid/graphics/Matrix;

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFinalPathMatrix:Landroid/graphics/Matrix;

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mBaseWidth:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mBaseHeight:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportWidth:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportHeight:F

    const/16 v0, 0xff

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootAlpha:I

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootName:Ljava/lang/String;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mIsStateful:Ljava/lang/Boolean;

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mVGTargetsMap:Landroid/support/v4/util/ArrayMap;

    new-instance v0, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    invoke-direct {v0}, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;-><init>()V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootGroup:Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPath:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    return-void
.end method

.method public constructor <init>(Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFinalPathMatrix:Landroid/graphics/Matrix;

    const/4 v0, 0x0

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mBaseWidth:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mBaseHeight:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportWidth:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportHeight:F

    const/16 v0, 0xff

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootAlpha:I

    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootName:Ljava/lang/String;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mIsStateful:Ljava/lang/Boolean;

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mVGTargetsMap:Landroid/support/v4/util/ArrayMap;

    new-instance v0, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    iget-object v1, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootGroup:Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    iget-object v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mVGTargetsMap:Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0, v1, v2}, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;-><init>(Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;Landroid/support/v4/util/ArrayMap;)V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootGroup:Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    new-instance v0, Landroid/graphics/Path;

    iget-object v1, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPath:Landroid/graphics/Path;

    invoke-direct {v0, v1}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPath:Landroid/graphics/Path;

    new-instance v0, Landroid/graphics/Path;

    iget-object v1, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    invoke-direct {v0, v1}, Landroid/graphics/Path;-><init>(Landroid/graphics/Path;)V

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mBaseWidth:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mBaseWidth:F

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mBaseHeight:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mBaseHeight:F

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportWidth:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportWidth:F

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportHeight:F

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportHeight:F

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mChangingConfigurations:I

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mChangingConfigurations:I

    iget v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootAlpha:I

    iput v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootAlpha:I

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootName:Ljava/lang/String;

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootName:Ljava/lang/String;

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootName:Ljava/lang/String;

    if-eqz v0, :cond_67

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mVGTargetsMap:Landroid/support/v4/util/ArrayMap;

    iget-object v1, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootName:Ljava/lang/String;

    invoke-virtual {v0, v1, p0}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_67
    iget-object p1, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mIsStateful:Ljava/lang/Boolean;

    iput-object p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mIsStateful:Ljava/lang/Boolean;

    return-void
.end method

.method private static cross(FFFF)F
    .registers 4

    mul-float p0, p0, p3

    mul-float p1, p1, p2

    sub-float/2addr p0, p1

    return p0
.end method

.method private drawGroupTree(Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;Landroid/graphics/Matrix;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V
    .registers 16

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;->mStackedMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v0, p2}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object p2, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;->mStackedMatrix:Landroid/graphics/Matrix;

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;->mLocalMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p2, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    invoke-virtual {p3}, Landroid/graphics/Canvas;->save()I

    const/4 p2, 0x0

    :goto_10
    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p2, v0, :cond_45

    iget-object v0, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;->mChildren:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/graphics/drawable/VectorDrawableCompat$VObject;

    instance-of v1, v0, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    if-eqz v1, :cond_32

    move-object v3, v0

    check-cast v3, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    iget-object v4, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;->mStackedMatrix:Landroid/graphics/Matrix;

    move-object v2, p0

    move-object v5, p3

    move v6, p4

    move v7, p5

    move-object v8, p6

    invoke-direct/range {v2 .. v8}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->drawGroupTree(Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;Landroid/graphics/Matrix;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V

    goto :goto_42

    :cond_32
    instance-of v1, v0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;

    if-eqz v1, :cond_42

    move-object v4, v0

    check-cast v4, Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;

    move-object v2, p0

    move-object v3, p1

    move-object v5, p3

    move v6, p4

    move v7, p5

    move-object v8, p6

    invoke-direct/range {v2 .. v8}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->drawPath(Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V

    :cond_42
    :goto_42
    add-int/lit8 p2, p2, 0x1

    goto :goto_10

    :cond_45
    invoke-virtual {p3}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method private drawPath(Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V
    .registers 14

    int-to-float p4, p4

    iget v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportWidth:F

    div-float/2addr p4, v0

    int-to-float p5, p5

    iget v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mViewportHeight:F

    div-float/2addr p5, v0

    invoke-static {p4, p5}, Ljava/lang/Math;->min(FF)F

    move-result v0

    iget-object p1, p1, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;->mStackedMatrix:Landroid/graphics/Matrix;

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFinalPathMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, p1}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFinalPathMatrix:Landroid/graphics/Matrix;

    invoke-virtual {v1, p4, p5}, Landroid/graphics/Matrix;->postScale(FF)Z

    invoke-direct {p0, p1}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->getMatrixScale(Landroid/graphics/Matrix;)F

    move-result p1

    const/4 p4, 0x0

    cmpl-float p5, p1, p4

    if-nez p5, :cond_22

    return-void

    :cond_22
    iget-object p5, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPath:Landroid/graphics/Path;

    invoke-virtual {p2, p5}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;->toPath(Landroid/graphics/Path;)V

    iget-object p5, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPath:Landroid/graphics/Path;

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    invoke-virtual {p2}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPath;->isClipPath()Z

    move-result v1

    if-eqz v1, :cond_42

    iget-object p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    iget-object p2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFinalPathMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p1, p5, p2}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    iget-object p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    invoke-virtual {p3, p1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    goto/16 :goto_16f

    :cond_42
    check-cast p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;

    iget v1, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x1

    cmpl-float v1, v1, p4

    if-nez v1, :cond_53

    iget v1, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_96

    :cond_53
    iget v1, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathStart:F

    iget v4, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    add-float/2addr v1, v4

    rem-float/2addr v1, v2

    iget v4, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathEnd:F

    iget v5, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mTrimPathOffset:F

    add-float/2addr v4, v5

    rem-float/2addr v4, v2

    iget-object v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPathMeasure:Landroid/graphics/PathMeasure;

    if-nez v2, :cond_6a

    new-instance v2, Landroid/graphics/PathMeasure;

    invoke-direct {v2}, Landroid/graphics/PathMeasure;-><init>()V

    iput-object v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPathMeasure:Landroid/graphics/PathMeasure;

    :cond_6a
    iget-object v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPathMeasure:Landroid/graphics/PathMeasure;

    iget-object v5, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPath:Landroid/graphics/Path;

    const/4 v6, 0x0

    invoke-virtual {v2, v5, v6}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    iget-object v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPathMeasure:Landroid/graphics/PathMeasure;

    invoke-virtual {v2}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v2

    mul-float v1, v1, v2

    mul-float v4, v4, v2

    invoke-virtual {p5}, Landroid/graphics/Path;->reset()V

    cmpl-float v5, v1, v4

    if-lez v5, :cond_8e

    iget-object v5, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPathMeasure:Landroid/graphics/PathMeasure;

    invoke-virtual {v5, v1, v2, p5, v3}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPathMeasure:Landroid/graphics/PathMeasure;

    invoke-virtual {v1, p4, v4, p5, v3}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    goto :goto_93

    :cond_8e
    iget-object v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mPathMeasure:Landroid/graphics/PathMeasure;

    invoke-virtual {v2, v1, v4, p5, v3}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    :goto_93
    invoke-virtual {p5, p4, p4}, Landroid/graphics/Path;->rLineTo(FF)V

    :cond_96
    iget-object p4, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFinalPathMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p4, p5, v1}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;Landroid/graphics/Matrix;)V

    iget-object p4, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {p4}, Landroid/support/v4/content/res/ComplexColorCompat;->willDraw()Z

    move-result p4

    const/high16 p5, 0x437f0000    # 255.0f

    if-eqz p4, :cond_fe

    iget-object p4, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillColor:Landroid/support/v4/content/res/ComplexColorCompat;

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFillPaint:Landroid/graphics/Paint;

    if-nez v1, :cond_bb

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFillPaint:Landroid/graphics/Paint;

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFillPaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_bb
    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFillPaint:Landroid/graphics/Paint;

    invoke-virtual {p4}, Landroid/support/v4/content/res/ComplexColorCompat;->isGradient()Z

    move-result v2

    if-eqz v2, :cond_db

    invoke-virtual {p4}, Landroid/support/v4/content/res/ComplexColorCompat;->getShader()Landroid/graphics/Shader;

    move-result-object p4

    iget-object v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFinalPathMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p4, v2}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    invoke-virtual {v1, p4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget p4, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    mul-float p4, p4, p5

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    invoke-virtual {v1, p4}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_e8

    :cond_db
    invoke-virtual {p4}, Landroid/support/v4/content/res/ComplexColorCompat;->getColor()I

    move-result p4

    iget v2, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillAlpha:F

    invoke-static {p4, v2}, Landroid/support/graphics/drawable/VectorDrawableCompat;->applyAlpha(IF)I

    move-result p4

    invoke-virtual {v1, p4}, Landroid/graphics/Paint;->setColor(I)V

    :goto_e8
    invoke-virtual {v1, p6}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    iget-object p4, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    iget v2, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mFillRule:I

    if-nez v2, :cond_f4

    sget-object v2, Landroid/graphics/Path$FillType;->WINDING:Landroid/graphics/Path$FillType;

    goto :goto_f6

    :cond_f4
    sget-object v2, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    :goto_f6
    invoke-virtual {p4, v2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    iget-object p4, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    invoke-virtual {p3, p4, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_fe
    iget-object p4, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

    invoke-virtual {p4}, Landroid/support/v4/content/res/ComplexColorCompat;->willDraw()Z

    move-result p4

    if-eqz p4, :cond_16f

    iget-object p4, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeColor:Landroid/support/v4/content/res/ComplexColorCompat;

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mStrokePaint:Landroid/graphics/Paint;

    if-nez v1, :cond_11a

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, v3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mStrokePaint:Landroid/graphics/Paint;

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mStrokePaint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    :cond_11a
    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mStrokePaint:Landroid/graphics/Paint;

    iget-object v2, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineJoin:Landroid/graphics/Paint$Join;

    if-eqz v2, :cond_125

    iget-object v2, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineJoin:Landroid/graphics/Paint$Join;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    :cond_125
    iget-object v2, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineCap:Landroid/graphics/Paint$Cap;

    if-eqz v2, :cond_12e

    iget-object v2, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeLineCap:Landroid/graphics/Paint$Cap;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    :cond_12e
    iget v2, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeMiterlimit:F

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStrokeMiter(F)V

    invoke-virtual {p4}, Landroid/support/v4/content/res/ComplexColorCompat;->isGradient()Z

    move-result v2

    if-eqz v2, :cond_151

    invoke-virtual {p4}, Landroid/support/v4/content/res/ComplexColorCompat;->getShader()Landroid/graphics/Shader;

    move-result-object p4

    iget-object v2, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mFinalPathMatrix:Landroid/graphics/Matrix;

    invoke-virtual {p4, v2}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    invoke-virtual {v1, p4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget p4, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    mul-float p4, p4, p5

    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    invoke-virtual {v1, p4}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_15e

    :cond_151
    invoke-virtual {p4}, Landroid/support/v4/content/res/ComplexColorCompat;->getColor()I

    move-result p4

    iget p5, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeAlpha:F

    invoke-static {p4, p5}, Landroid/support/graphics/drawable/VectorDrawableCompat;->applyAlpha(IF)I

    move-result p4

    invoke-virtual {v1, p4}, Landroid/graphics/Paint;->setColor(I)V

    :goto_15e
    invoke-virtual {v1, p6}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    mul-float v0, v0, p1

    iget p1, p2, Landroid/support/graphics/drawable/VectorDrawableCompat$VFullPath;->mStrokeWidth:F

    mul-float p1, p1, v0

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    iget-object p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRenderPath:Landroid/graphics/Path;

    invoke-virtual {p3, p1, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_16f
    :goto_16f
    return-void
.end method

.method private getMatrixScale(Landroid/graphics/Matrix;)F
    .registers 11

    const/4 v0, 0x4

    new-array v0, v0, [F

    fill-array-data v0, :array_40

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->mapVectors([F)V

    const/4 p1, 0x0

    aget v1, v0, p1

    float-to-double v1, v1

    const/4 v3, 0x1

    aget v4, v0, v3

    float-to-double v4, v4

    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v1

    double-to-float v1, v1

    const/4 v2, 0x2

    aget v4, v0, v2

    float-to-double v4, v4

    const/4 v6, 0x3

    aget v7, v0, v6

    float-to-double v7, v7

    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v4

    double-to-float v4, v4

    aget p1, v0, p1

    aget v3, v0, v3

    aget v2, v0, v2

    aget v0, v0, v6

    invoke-static {p1, v3, v2, v0}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->cross(FFFF)F

    move-result p1

    invoke-static {v1, v4}, Ljava/lang/Math;->max(FF)F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-lez v2, :cond_3e

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    div-float v1, p1, v0

    :cond_3e
    return v1

    nop

    :array_40
    .array-data 4
        0x0
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V
    .registers 12

    iget-object v1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootGroup:Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    sget-object v2, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->IDENTITY_MATRIX:Landroid/graphics/Matrix;

    move-object v0, p0

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-direct/range {v0 .. v6}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->drawGroupTree(Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;Landroid/graphics/Matrix;Landroid/graphics/Canvas;IILandroid/graphics/ColorFilter;)V

    return-void
.end method

.method public getAlpha()F
    .registers 3

    invoke-virtual {p0}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->getRootAlpha()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x437f0000    # 255.0f

    div-float/2addr v0, v1

    return v0
.end method

.method public getRootAlpha()I
    .registers 2

    iget v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootAlpha:I

    return v0
.end method

.method public isStateful()Z
    .registers 2

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mIsStateful:Ljava/lang/Boolean;

    if-nez v0, :cond_10

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootGroup:Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    invoke-virtual {v0}, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;->isStateful()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mIsStateful:Ljava/lang/Boolean;

    :cond_10
    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mIsStateful:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    return v0
.end method

.method public onStateChanged([I)Z
    .registers 3

    iget-object v0, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootGroup:Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;

    invoke-virtual {v0, p1}, Landroid/support/graphics/drawable/VectorDrawableCompat$VGroup;->onStateChanged([I)Z

    move-result p1

    return p1
.end method

.method public setAlpha(F)V
    .registers 3

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    invoke-virtual {p0, p1}, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->setRootAlpha(I)V

    return-void
.end method

.method public setRootAlpha(I)V
    .registers 2

    iput p1, p0, Landroid/support/graphics/drawable/VectorDrawableCompat$VPathRenderer;->mRootAlpha:I

    return-void
.end method
