.class Landroid/support/v7/widget/AppCompatBackgroundHelper;
.super Ljava/lang/Object;
.source "AppCompatBackgroundHelper.java"


# instance fields
.field private mBackgroundResId:I

.field private mBackgroundTint:Landroid/support/v7/widget/TintInfo;

.field private final mDrawableManager:Landroid/support/v7/widget/AppCompatDrawableManager;

.field private mInternalBackgroundTint:Landroid/support/v7/widget/TintInfo;

.field private mTmpInfo:Landroid/support/v7/widget/TintInfo;

.field private final mView:Landroid/view/View;


# direct methods
.method constructor <init>(Landroid/view/View;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundResId:I

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-static {}, Landroid/support/v7/widget/AppCompatDrawableManager;->get()Landroid/support/v7/widget/AppCompatDrawableManager;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mDrawableManager:Landroid/support/v7/widget/AppCompatDrawableManager;

    return-void
.end method

.method private applyFrameworkTintUsingColorFilter(Landroid/graphics/drawable/Drawable;)Z
    .registers 5
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mTmpInfo:Landroid/support/v7/widget/TintInfo;

    if-nez v0, :cond_b

    new-instance v0, Landroid/support/v7/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mTmpInfo:Landroid/support/v7/widget/TintInfo;

    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mTmpInfo:Landroid/support/v7/widget/TintInfo;

    invoke-virtual {v0}, Landroid/support/v7/widget/TintInfo;->clear()V

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getBackgroundTintList(Landroid/view/View;)Landroid/content/res/ColorStateList;

    move-result-object v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1d

    iput-boolean v2, v0, Landroid/support/v7/widget/TintInfo;->mHasTintList:Z

    iput-object v1, v0, Landroid/support/v7/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    :cond_1d
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getBackgroundTintMode(Landroid/view/View;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v1

    if-eqz v1, :cond_29

    iput-boolean v2, v0, Landroid/support/v7/widget/TintInfo;->mHasTintMode:Z

    iput-object v1, v0, Landroid/support/v7/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    :cond_29
    iget-boolean v1, v0, Landroid/support/v7/widget/TintInfo;->mHasTintList:Z

    if-nez v1, :cond_34

    iget-boolean v1, v0, Landroid/support/v7/widget/TintInfo;->mHasTintMode:Z

    if-eqz v1, :cond_32

    goto :goto_34

    :cond_32
    const/4 p1, 0x0

    return p1

    :cond_34
    :goto_34
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getDrawableState()[I

    move-result-object v1

    invoke-static {p1, v0, v1}, Landroid/support/v7/widget/AppCompatDrawableManager;->tintDrawable(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;[I)V

    return v2
.end method

.method private shouldApplyFrameworkTintUsingColorFilter()Z
    .registers 5

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/16 v3, 0x15

    if-le v0, v3, :cond_e

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mInternalBackgroundTint:Landroid/support/v7/widget/TintInfo;

    if-eqz v0, :cond_d

    const/4 v1, 0x1

    :cond_d
    return v1

    :cond_e
    if-ne v0, v3, :cond_11

    return v2

    :cond_11
    return v1
.end method


# virtual methods
.method applySupportBackgroundTint()V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_34

    invoke-direct {p0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->shouldApplyFrameworkTintUsingColorFilter()Z

    move-result v1

    if-eqz v1, :cond_15

    invoke-direct {p0, v0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->applyFrameworkTintUsingColorFilter(Landroid/graphics/drawable/Drawable;)Z

    move-result v1

    if-eqz v1, :cond_15

    return-void

    :cond_15
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    if-eqz v1, :cond_25

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/support/v7/widget/AppCompatDrawableManager;->tintDrawable(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;[I)V

    goto :goto_34

    :cond_25
    iget-object v1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mInternalBackgroundTint:Landroid/support/v7/widget/TintInfo;

    if-eqz v1, :cond_34

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mInternalBackgroundTint:Landroid/support/v7/widget/TintInfo;

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getDrawableState()[I

    move-result-object v2

    invoke-static {v0, v1, v2}, Landroid/support/v7/widget/AppCompatDrawableManager;->tintDrawable(Landroid/graphics/drawable/Drawable;Landroid/support/v7/widget/TintInfo;[I)V

    :cond_34
    :goto_34
    return-void
.end method

.method getSupportBackgroundTintList()Landroid/content/res/ColorStateList;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    iget-object v0, v0, Landroid/support/v7/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method getSupportBackgroundTintMode()Landroid/graphics/PorterDuff$Mode;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    if-eqz v0, :cond_9

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    iget-object v0, v0, Landroid/support/v7/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return-object v0
.end method

.method loadFromAttributes(Landroid/util/AttributeSet;I)V
    .registers 6

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Landroid/support/v7/appcompat/R$styleable;->ViewBackgroundHelper:[I

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, p2, v2}, Landroid/support/v7/widget/TintTypedArray;->obtainStyledAttributes(Landroid/content/Context;Landroid/util/AttributeSet;[III)Landroid/support/v7/widget/TintTypedArray;

    move-result-object p1

    :try_start_d
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ViewBackgroundHelper_android_background:I

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result p2

    const/4 v0, -0x1

    if-eqz p2, :cond_31

    sget p2, Landroid/support/v7/appcompat/R$styleable;->ViewBackgroundHelper_android_background:I

    invoke-virtual {p1, p2, v0}, Landroid/support/v7/widget/TintTypedArray;->getResourceId(II)I

    move-result p2

    iput p2, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundResId:I

    iget-object p2, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mDrawableManager:Landroid/support/v7/widget/AppCompatDrawableManager;

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundResId:I

    invoke-virtual {p2, v1, v2}, Landroid/support/v7/widget/AppCompatDrawableManager;->getTintList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p2

    if-eqz p2, :cond_31

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    :cond_31
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ViewBackgroundHelper_backgroundTint:I

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_44

    iget-object p2, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    sget v1, Landroid/support/v7/appcompat/R$styleable;->ViewBackgroundHelper_backgroundTint:I

    invoke-virtual {p1, v1}, Landroid/support/v7/widget/TintTypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-static {p2, v1}, Landroid/support/v4/view/ViewCompat;->setBackgroundTintList(Landroid/view/View;Landroid/content/res/ColorStateList;)V

    :cond_44
    sget p2, Landroid/support/v7/appcompat/R$styleable;->ViewBackgroundHelper_backgroundTintMode:I

    invoke-virtual {p1, p2}, Landroid/support/v7/widget/TintTypedArray;->hasValue(I)Z

    move-result p2

    if-eqz p2, :cond_5c

    iget-object p2, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    sget v1, Landroid/support/v7/appcompat/R$styleable;->ViewBackgroundHelper_backgroundTintMode:I

    invoke-virtual {p1, v1, v0}, Landroid/support/v7/widget/TintTypedArray;->getInt(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/support/v7/widget/DrawableUtils;->parseTintMode(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object v0

    invoke-static {p2, v0}, Landroid/support/v4/view/ViewCompat;->setBackgroundTintMode(Landroid/view/View;Landroid/graphics/PorterDuff$Mode;)V
    :try_end_5c
    .catchall {:try_start_d .. :try_end_5c} :catchall_60

    :cond_5c
    invoke-virtual {p1}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    return-void

    :catchall_60
    move-exception p2

    invoke-virtual {p1}, Landroid/support/v7/widget/TintTypedArray;->recycle()V

    throw p2
.end method

.method onSetBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    const/4 p1, -0x1

    iput p1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundResId:I

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->applySupportBackgroundTint()V

    return-void
.end method

.method onSetBackgroundResource(I)V
    .registers 4

    iput p1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundResId:I

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mDrawableManager:Landroid/support/v7/widget/AppCompatDrawableManager;

    if-eqz v0, :cond_13

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mDrawableManager:Landroid/support/v7/widget/AppCompatDrawableManager;

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p1}, Landroid/support/v7/widget/AppCompatDrawableManager;->getTintList(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    goto :goto_14

    :cond_13
    const/4 p1, 0x0

    :goto_14
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->applySupportBackgroundTint()V

    return-void
.end method

.method setInternalBackgroundTint(Landroid/content/res/ColorStateList;)V
    .registers 3

    if-eqz p1, :cond_17

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mInternalBackgroundTint:Landroid/support/v7/widget/TintInfo;

    if-nez v0, :cond_d

    new-instance v0, Landroid/support/v7/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mInternalBackgroundTint:Landroid/support/v7/widget/TintInfo;

    :cond_d
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mInternalBackgroundTint:Landroid/support/v7/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mInternalBackgroundTint:Landroid/support/v7/widget/TintInfo;

    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/support/v7/widget/TintInfo;->mHasTintList:Z

    goto :goto_1a

    :cond_17
    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mInternalBackgroundTint:Landroid/support/v7/widget/TintInfo;

    :goto_1a
    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->applySupportBackgroundTint()V

    return-void
.end method

.method setSupportBackgroundTintList(Landroid/content/res/ColorStateList;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    if-nez v0, :cond_b

    new-instance v0, Landroid/support/v7/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/widget/TintInfo;->mTintList:Landroid/content/res/ColorStateList;

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/support/v7/widget/TintInfo;->mHasTintList:Z

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->applySupportBackgroundTint()V

    return-void
.end method

.method setSupportBackgroundTintMode(Landroid/graphics/PorterDuff$Mode;)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    if-nez v0, :cond_b

    new-instance v0, Landroid/support/v7/widget/TintInfo;

    invoke-direct {v0}, Landroid/support/v7/widget/TintInfo;-><init>()V

    iput-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    :cond_b
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    iput-object p1, v0, Landroid/support/v7/widget/TintInfo;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    iget-object p1, p0, Landroid/support/v7/widget/AppCompatBackgroundHelper;->mBackgroundTint:Landroid/support/v7/widget/TintInfo;

    const/4 v0, 0x1

    iput-boolean v0, p1, Landroid/support/v7/widget/TintInfo;->mHasTintMode:Z

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatBackgroundHelper;->applySupportBackgroundTint()V

    return-void
.end method
