.class public Landroid/support/v4/view/PagerTitleStrip;
.super Landroid/view/ViewGroup;
.source "PagerTitleStrip.java"


# annotations
.annotation runtime Landroid/support/v4/view/ViewPager$DecorView;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/view/PagerTitleStrip$PageListener;,
        Landroid/support/v4/view/PagerTitleStrip$SingleLineAllCapsTransform;
    }
.end annotation


# static fields
.field private static final ATTRS:[I

.field private static final SIDE_ALPHA:F = 0.6f

.field private static final TEXT_ATTRS:[I

.field private static final TEXT_SPACING:I = 0x10


# instance fields
.field mCurrText:Landroid/widget/TextView;

.field private mGravity:I

.field private mLastKnownCurrentPage:I

.field mLastKnownPositionOffset:F

.field mNextText:Landroid/widget/TextView;

.field private mNonPrimaryAlpha:I

.field private final mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

.field mPager:Landroid/support/v4/view/ViewPager;

.field mPrevText:Landroid/widget/TextView;

.field private mScaledTextSpacing:I

.field mTextColor:I

.field private mUpdatingPositions:Z

.field private mUpdatingText:Z

.field private mWatchingAdapter:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/support/v4/view/PagerAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_14

    sput-object v0, Landroid/support/v4/view/PagerTitleStrip;->ATTRS:[I

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x101038c

    aput v2, v0, v1

    sput-object v0, Landroid/support/v4/view/PagerTitleStrip;->TEXT_ATTRS:[I

    return-void

    :array_14
    .array-data 4
        0x1010034
        0x1010095
        0x1010098
        0x10100af
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Landroid/support/v4/view/PagerTitleStrip;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 7
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    new-instance v0, Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-direct {v0, p0}, Landroid/support/v4/view/PagerTitleStrip$PageListener;-><init>(Landroid/support/v4/view/PagerTitleStrip;)V

    iput-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/support/v4/view/PagerTitleStrip;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/support/v4/view/PagerTitleStrip;->addView(Landroid/view/View;)V

    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/support/v4/view/PagerTitleStrip;->addView(Landroid/view/View;)V

    sget-object v0, Landroid/support/v4/view/PagerTitleStrip;->ATTRS:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    if-eqz v1, :cond_4b

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-static {v2, v1}, Landroid/support/v4/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-static {v2, v1}, Landroid/support/v4/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-static {v2, v1}, Landroid/support/v4/widget/TextViewCompat;->setTextAppearance(Landroid/widget/TextView;I)V

    :cond_4b
    const/4 v2, 0x1

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v2

    if-eqz v2, :cond_56

    int-to-float v2, v2

    invoke-virtual {p0, v0, v2}, Landroid/support/v4/view/PagerTitleStrip;->setTextSize(IF)V

    :cond_56
    const/4 v2, 0x2

    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v3

    if-eqz v3, :cond_70

    invoke-virtual {p2, v2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v2

    iget-object v3, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v3, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v3, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_70
    const/4 v2, 0x3

    const/16 v3, 0x50

    invoke-virtual {p2, v2, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v2

    iput v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mGravity:I

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->getTextColors()Landroid/content/res/ColorStateList;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p2

    iput p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mTextColor:I

    const p2, 0x3f19999a    # 0.6f

    invoke-virtual {p0, p2}, Landroid/support/v4/view/PagerTitleStrip;->setNonPrimaryAlpha(F)V

    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    if-eqz v1, :cond_b2

    sget-object p2, Landroid/support/v4/view/PagerTitleStrip;->TEXT_ATTRS:[I

    invoke-virtual {p1, v1, p2}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p2

    invoke-virtual {p2, v0, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v0

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    :cond_b2
    if-eqz v0, :cond_c4

    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-static {p2}, Landroid/support/v4/view/PagerTitleStrip;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-static {p2}, Landroid/support/v4/view/PagerTitleStrip;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-static {p2}, Landroid/support/v4/view/PagerTitleStrip;->setSingleLineAllCaps(Landroid/widget/TextView;)V

    goto :goto_d3

    :cond_c4
    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->setSingleLine()V

    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->setSingleLine()V

    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/widget/TextView;->setSingleLine()V

    :goto_d3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    const/high16 p2, 0x41800000    # 16.0f

    mul-float p1, p1, p2

    float-to-int p1, p1

    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    return-void
.end method

.method private static setSingleLineAllCaps(Landroid/widget/TextView;)V
    .registers 3

    new-instance v0, Landroid/support/v4/view/PagerTitleStrip$SingleLineAllCapsTransform;

    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v4/view/PagerTitleStrip$SingleLineAllCapsTransform;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    return-void
.end method


# virtual methods
.method getMinHeight()I
    .registers 2

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method public getTextSpacing()I
    .registers 2

    iget v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    return v0
.end method

.method protected onAttachedToWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/support/v4/view/ViewPager;

    if-eqz v1, :cond_2f

    check-cast v0, Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v1

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->setInternalPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->addOnAdapterChangeListener(Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;)V

    iput-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_2a

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/PagerAdapter;

    goto :goto_2b

    :cond_2a
    const/4 v0, 0x0

    :goto_2b
    invoke-virtual {p0, v0, v1}, Landroid/support/v4/view/PagerTitleStrip;->updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    return-void

    :cond_2f
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "PagerTitleStrip must be a direct child of a ViewPager."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected onDetachedFromWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    if-eqz v0, :cond_1f

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/view/PagerTitleStrip;->updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setInternalPageChangeListener(Landroid/support/v4/view/ViewPager$OnPageChangeListener;)Landroid/support/v4/view/ViewPager$OnPageChangeListener;

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-virtual {v0, v2}, Landroid/support/v4/view/ViewPager;->removeOnAdapterChangeListener(Landroid/support/v4/view/ViewPager$OnAdapterChangeListener;)V

    iput-object v1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    :cond_1f
    return-void
.end method

.method protected onLayout(ZIIII)V
    .registers 6

    iget-object p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    if-eqz p1, :cond_13

    iget p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    const/4 p2, 0x0

    cmpl-float p1, p1, p2

    if-ltz p1, :cond_d

    iget p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    :cond_d
    iget p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    const/4 p3, 0x1

    invoke-virtual {p0, p1, p2, p3}, Landroid/support/v4/view/PagerTitleStrip;->updateTextPositions(IFZ)V

    :cond_13
    return-void
.end method

.method protected onMeasure(II)V
    .registers 10

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    if-ne v0, v1, :cond_5e

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingBottom()I

    move-result v2

    add-int/2addr v0, v2

    const/4 v2, -0x2

    invoke-static {p2, v0, v2}, Landroid/support/v4/view/PagerTitleStrip;->getChildMeasureSpec(III)I

    move-result v3

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    int-to-float v5, v4

    const v6, 0x3e4ccccd    # 0.2f

    mul-float v5, v5, v6

    float-to-int v5, v5

    invoke-static {p1, v5, v2}, Landroid/support/v4/view/PagerTitleStrip;->getChildMeasureSpec(III)I

    move-result p1

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v2, p1, v3}, Landroid/widget/TextView;->measure(II)V

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v2, p1, v3}, Landroid/widget/TextView;->measure(II)V

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v2, p1, v3}, Landroid/widget/TextView;->measure(II)V

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result p1

    if-ne p1, v1, :cond_3f

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    goto :goto_4e

    :cond_3f
    iget-object p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result p1

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getMinHeight()I

    move-result v1

    add-int/2addr p1, v0

    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    :goto_4e
    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getMeasuredState()I

    move-result v0

    shl-int/lit8 v0, v0, 0x10

    invoke-static {p1, p2, v0}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result p1

    invoke-virtual {p0, v4, p1}, Landroid/support/v4/view/PagerTitleStrip;->setMeasuredDimension(II)V

    return-void

    :cond_5e
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Must measure with an exact width"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public requestLayout()V
    .registers 2

    iget-boolean v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingText:Z

    if-nez v0, :cond_7

    invoke-super {p0}, Landroid/view/ViewGroup;->requestLayout()V

    :cond_7
    return-void
.end method

.method public setGravity(I)V
    .registers 2

    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mGravity:I

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->requestLayout()V

    return-void
.end method

.method public setNonPrimaryAlpha(F)V
    .registers 4
    .param p1    # F
        .annotation build Landroid/support/annotation/FloatRange;
            from = 0.0
            to = 1.0
        .end annotation
    .end param

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    and-int/lit16 p1, p1, 0xff

    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mNonPrimaryAlpha:I

    iget p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mNonPrimaryAlpha:I

    shl-int/lit8 p1, p1, 0x18

    iget v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mTextColor:I

    const v1, 0xffffff

    and-int/2addr v0, v1

    or-int/2addr p1, v0

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public setTextColor(I)V
    .registers 4
    .param p1    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mTextColor:I

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    iget p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mNonPrimaryAlpha:I

    shl-int/lit8 p1, p1, 0x18

    iget v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mTextColor:I

    const v1, 0xffffff

    and-int/2addr v0, v1

    or-int/2addr p1, v0

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public setTextSize(IF)V
    .registers 4

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v0, p1, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    return-void
.end method

.method public setTextSpacing(I)V
    .registers 2

    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->requestLayout()V

    return-void
.end method

.method updateAdapter(Landroid/support/v4/view/PagerAdapter;Landroid/support/v4/view/PagerAdapter;)V
    .registers 4

    if-eqz p1, :cond_a

    iget-object v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-virtual {p1, v0}, Landroid/support/v4/view/PagerAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    :cond_a
    if-eqz p2, :cond_18

    iget-object p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPageListener:Landroid/support/v4/view/PagerTitleStrip$PageListener;

    invoke-virtual {p2, p1}, Landroid/support/v4/view/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mWatchingAdapter:Ljava/lang/ref/WeakReference;

    :cond_18
    iget-object p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    if-eqz p1, :cond_2f

    const/4 p1, -0x1

    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    const/high16 p1, -0x40800000    # -1.0f

    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    iget-object p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {p1}, Landroid/support/v4/view/ViewPager;->getCurrentItem()I

    move-result p1

    invoke-virtual {p0, p1, p2}, Landroid/support/v4/view/PagerTitleStrip;->updateText(ILandroid/support/v4/view/PagerAdapter;)V

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->requestLayout()V

    :cond_2f
    return-void
.end method

.method updateText(ILandroid/support/v4/view/PagerAdapter;)V
    .registers 8

    const/4 v0, 0x0

    if-eqz p2, :cond_8

    invoke-virtual {p2}, Landroid/support/v4/view/PagerAdapter;->getCount()I

    move-result v1

    goto :goto_9

    :cond_8
    const/4 v1, 0x0

    :goto_9
    const/4 v2, 0x1

    iput-boolean v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingText:Z

    const/4 v3, 0x0

    if-lt p1, v2, :cond_18

    if-eqz p2, :cond_18

    add-int/lit8 v2, p1, -0x1

    invoke-virtual {p2, v2}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v2

    goto :goto_19

    :cond_18
    move-object v2, v3

    :goto_19
    iget-object v4, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    if-eqz p2, :cond_29

    if-ge p1, v1, :cond_29

    invoke-virtual {p2, p1}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v4

    goto :goto_2a

    :cond_29
    move-object v4, v3

    :goto_2a
    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    add-int/lit8 v2, p1, 0x1

    if-ge v2, v1, :cond_37

    if-eqz p2, :cond_37

    invoke-virtual {p2, v2}, Landroid/support/v4/view/PagerAdapter;->getPageTitle(I)Ljava/lang/CharSequence;

    move-result-object v3

    :cond_37
    iget-object p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getWidth()I

    move-result p2

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingLeft()I

    move-result v1

    sub-int/2addr p2, v1

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingRight()I

    move-result v1

    sub-int/2addr p2, v1

    int-to-float p2, p2

    const v1, 0x3f4ccccd    # 0.8f

    mul-float p2, p2, v1

    float-to-int p2, p2

    invoke-static {v0, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    const/high16 v1, -0x80000000

    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getHeight()I

    move-result v2

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingTop()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingBottom()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-static {v0, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v2, p2, v1}, Landroid/widget/TextView;->measure(II)V

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v2, p2, v1}, Landroid/widget/TextView;->measure(II)V

    iget-object v2, p0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v2, p2, v1}, Landroid/widget/TextView;->measure(II)V

    iput p1, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    iget-boolean p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingPositions:Z

    if-nez p2, :cond_8b

    iget p2, p0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    invoke-virtual {p0, p1, p2, v0}, Landroid/support/v4/view/PagerTitleStrip;->updateTextPositions(IFZ)V

    :cond_8b
    iput-boolean v0, p0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingText:Z

    return-void
.end method

.method updateTextPositions(IFZ)V
    .registers 22

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    iget v3, v0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownCurrentPage:I

    if-eq v1, v3, :cond_14

    iget-object v3, v0, Landroid/support/v4/view/PagerTitleStrip;->mPager:Landroid/support/v4/view/ViewPager;

    invoke-virtual {v3}, Landroid/support/v4/view/ViewPager;->getAdapter()Landroid/support/v4/view/PagerAdapter;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Landroid/support/v4/view/PagerTitleStrip;->updateText(ILandroid/support/v4/view/PagerAdapter;)V

    goto :goto_1d

    :cond_14
    if-nez p3, :cond_1d

    iget v1, v0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    cmpl-float v1, v2, v1

    if-nez v1, :cond_1d

    return-void

    :cond_1d
    :goto_1d
    const/4 v1, 0x1

    iput-boolean v1, v0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingPositions:Z

    iget-object v1, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v1

    iget-object v3, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v3

    iget-object v4, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getMeasuredWidth()I

    move-result v4

    div-int/lit8 v5, v3, 0x2

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/PagerTitleStrip;->getWidth()I

    move-result v6

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/PagerTitleStrip;->getHeight()I

    move-result v7

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingLeft()I

    move-result v8

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingRight()I

    move-result v9

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingTop()I

    move-result v10

    invoke-virtual/range {p0 .. p0}, Landroid/support/v4/view/PagerTitleStrip;->getPaddingBottom()I

    move-result v11

    add-int v12, v8, v5

    add-int v13, v9, v5

    sub-int v12, v6, v12

    sub-int/2addr v12, v13

    const/high16 v14, 0x3f000000    # 0.5f

    add-float/2addr v14, v2

    const/high16 v15, 0x3f800000    # 1.0f

    cmpl-float v16, v14, v15

    if-lez v16, :cond_5d

    sub-float/2addr v14, v15

    :cond_5d
    sub-int v13, v6, v13

    int-to-float v12, v12

    mul-float v12, v12, v14

    float-to-int v12, v12

    sub-int/2addr v13, v12

    sub-int/2addr v13, v5

    add-int/2addr v3, v13

    iget-object v5, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getBaseline()I

    move-result v5

    iget-object v12, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v12}, Landroid/widget/TextView;->getBaseline()I

    move-result v12

    iget-object v14, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v14}, Landroid/widget/TextView;->getBaseline()I

    move-result v14

    invoke-static {v5, v12}, Ljava/lang/Math;->max(II)I

    move-result v15

    invoke-static {v15, v14}, Ljava/lang/Math;->max(II)I

    move-result v15

    sub-int v5, v15, v5

    sub-int v12, v15, v12

    sub-int/2addr v15, v14

    iget-object v14, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v14}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v14

    add-int/2addr v14, v5

    iget-object v2, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v2

    add-int/2addr v2, v12

    move/from16 v17, v4

    iget-object v4, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v4

    add-int/2addr v4, v15

    invoke-static {v14, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget v4, v0, Landroid/support/v4/view/PagerTitleStrip;->mGravity:I

    and-int/lit8 v4, v4, 0x70

    const/16 v14, 0x10

    if-eq v4, v14, :cond_bb

    const/16 v14, 0x50

    if-eq v4, v14, :cond_b4

    add-int/2addr v5, v10

    add-int/2addr v12, v10

    add-int/2addr v10, v15

    goto :goto_c4

    :cond_b4
    sub-int/2addr v7, v11

    sub-int/2addr v7, v2

    add-int/2addr v5, v7

    add-int/2addr v12, v7

    add-int v10, v7, v15

    goto :goto_c4

    :cond_bb
    sub-int/2addr v7, v10

    sub-int/2addr v7, v11

    sub-int/2addr v7, v2

    div-int/lit8 v7, v7, 0x2

    add-int/2addr v5, v7

    add-int/2addr v12, v7

    add-int v10, v7, v15

    :goto_c4
    iget-object v2, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    iget-object v4, v0, Landroid/support/v4/view/PagerTitleStrip;->mCurrText:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v4

    add-int/2addr v4, v12

    invoke-virtual {v2, v13, v12, v3, v4}, Landroid/widget/TextView;->layout(IIII)V

    iget v2, v0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    sub-int/2addr v13, v2

    sub-int/2addr v13, v1

    invoke-static {v8, v13}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget-object v4, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    add-int/2addr v1, v2

    iget-object v7, v0, Landroid/support/v4/view/PagerTitleStrip;->mPrevText:Landroid/widget/TextView;

    invoke-virtual {v7}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v7

    add-int/2addr v7, v5

    invoke-virtual {v4, v2, v5, v1, v7}, Landroid/widget/TextView;->layout(IIII)V

    sub-int/2addr v6, v9

    sub-int v6, v6, v17

    iget v1, v0, Landroid/support/v4/view/PagerTitleStrip;->mScaledTextSpacing:I

    add-int/2addr v3, v1

    invoke-static {v6, v3}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget-object v2, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    add-int v4, v1, v17

    iget-object v3, v0, Landroid/support/v4/view/PagerTitleStrip;->mNextText:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getMeasuredHeight()I

    move-result v3

    add-int/2addr v3, v10

    invoke-virtual {v2, v1, v10, v4, v3}, Landroid/widget/TextView;->layout(IIII)V

    move/from16 v1, p2

    iput v1, v0, Landroid/support/v4/view/PagerTitleStrip;->mLastKnownPositionOffset:F

    const/4 v1, 0x0

    iput-boolean v1, v0, Landroid/support/v4/view/PagerTitleStrip;->mUpdatingPositions:Z

    return-void
.end method
