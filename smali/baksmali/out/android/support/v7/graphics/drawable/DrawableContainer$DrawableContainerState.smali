.class abstract Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;
.super Landroid/graphics/drawable/Drawable$ConstantState;
.source "DrawableContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/graphics/drawable/DrawableContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "DrawableContainerState"
.end annotation


# instance fields
.field mAutoMirrored:Z

.field mCanConstantState:Z

.field mChangingConfigurations:I

.field mCheckedConstantSize:Z

.field mCheckedConstantState:Z

.field mCheckedOpacity:Z

.field mCheckedPadding:Z

.field mCheckedStateful:Z

.field mChildrenChangingConfigurations:I

.field mColorFilter:Landroid/graphics/ColorFilter;

.field mConstantHeight:I

.field mConstantMinimumHeight:I

.field mConstantMinimumWidth:I

.field mConstantPadding:Landroid/graphics/Rect;

.field mConstantSize:Z

.field mConstantWidth:I

.field mDensity:I

.field mDither:Z

.field mDrawableFutures:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Landroid/graphics/drawable/Drawable$ConstantState;",
            ">;"
        }
    .end annotation
.end field

.field mDrawables:[Landroid/graphics/drawable/Drawable;

.field mEnterFadeDuration:I

.field mExitFadeDuration:I

.field mHasColorFilter:Z

.field mHasTintList:Z

.field mHasTintMode:Z

.field mLayoutDirection:I

.field mMutated:Z

.field mNumChildren:I

.field mOpacity:I

.field final mOwner:Landroid/support/v7/graphics/drawable/DrawableContainer;

.field mSourceRes:Landroid/content/res/Resources;

.field mStateful:Z

.field mTintList:Landroid/content/res/ColorStateList;

.field mTintMode:Landroid/graphics/PorterDuff$Mode;

.field mVariablePadding:Z


# direct methods
.method constructor <init>(Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;Landroid/support/v7/graphics/drawable/DrawableContainer;Landroid/content/res/Resources;)V
    .registers 6

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable$ConstantState;-><init>()V

    const/16 v0, 0xa0

    iput v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDensity:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mVariablePadding:Z

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantSize:Z

    const/4 v1, 0x1

    iput-boolean v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDither:Z

    iput v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mEnterFadeDuration:I

    iput v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mExitFadeDuration:I

    iput-object p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mOwner:Landroid/support/v7/graphics/drawable/DrawableContainer;

    if-eqz p3, :cond_19

    move-object p2, p3

    goto :goto_1f

    :cond_19
    if-eqz p1, :cond_1e

    iget-object p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mSourceRes:Landroid/content/res/Resources;

    goto :goto_1f

    :cond_1e
    const/4 p2, 0x0

    :goto_1f
    iput-object p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mSourceRes:Landroid/content/res/Resources;

    if-eqz p1, :cond_26

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDensity:I

    goto :goto_27

    :cond_26
    const/4 p2, 0x0

    :goto_27
    invoke-static {p3, p2}, Landroid/support/v7/graphics/drawable/DrawableContainer;->resolveDensity(Landroid/content/res/Resources;I)I

    move-result p2

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDensity:I

    if-eqz p1, :cond_f0

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChangingConfigurations:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChangingConfigurations:I

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChildrenChangingConfigurations:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChildrenChangingConfigurations:I

    iput-boolean v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantState:Z

    iput-boolean v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCanConstantState:Z

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mVariablePadding:Z

    iput-boolean p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mVariablePadding:Z

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantSize:Z

    iput-boolean p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantSize:Z

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDither:Z

    iput-boolean p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDither:Z

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mMutated:Z

    iput-boolean p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mMutated:Z

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mLayoutDirection:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mLayoutDirection:I

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mEnterFadeDuration:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mEnterFadeDuration:I

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mExitFadeDuration:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mExitFadeDuration:I

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mAutoMirrored:Z

    iput-boolean p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mAutoMirrored:Z

    iget-object p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mColorFilter:Landroid/graphics/ColorFilter;

    iput-object p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mColorFilter:Landroid/graphics/ColorFilter;

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mHasColorFilter:Z

    iput-boolean p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mHasColorFilter:Z

    iget-object p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mTintList:Landroid/content/res/ColorStateList;

    iput-object p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mTintList:Landroid/content/res/ColorStateList;

    iget-object p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    iput-object p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mTintMode:Landroid/graphics/PorterDuff$Mode;

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mHasTintList:Z

    iput-boolean p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mHasTintList:Z

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mHasTintMode:Z

    iput-boolean p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mHasTintMode:Z

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDensity:I

    iget p3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDensity:I

    if-ne p2, p3, :cond_9e

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedPadding:Z

    if-eqz p2, :cond_88

    new-instance p2, Landroid/graphics/Rect;

    iget-object p3, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantPadding:Landroid/graphics/Rect;

    invoke-direct {p2, p3}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    iput-object p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantPadding:Landroid/graphics/Rect;

    iput-boolean v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedPadding:Z

    :cond_88
    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantSize:Z

    if-eqz p2, :cond_9e

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantWidth:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantWidth:I

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantHeight:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantHeight:I

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumWidth:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumWidth:I

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumHeight:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumHeight:I

    iput-boolean v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantSize:Z

    :cond_9e
    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedOpacity:Z

    if-eqz p2, :cond_a8

    iget p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mOpacity:I

    iput p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mOpacity:I

    iput-boolean v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedOpacity:Z

    :cond_a8
    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedStateful:Z

    if-eqz p2, :cond_b2

    iget-boolean p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mStateful:Z

    iput-boolean p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mStateful:Z

    iput-boolean v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedStateful:Z

    :cond_b2
    iget-object p2, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    array-length p3, p2

    new-array p3, p3, [Landroid/graphics/drawable/Drawable;

    iput-object p3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    iget p3, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iput p3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object p1, p1, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    if-eqz p1, :cond_c8

    invoke-virtual {p1}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    move-result-object p1

    iput-object p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    goto :goto_d1

    :cond_c8
    new-instance p1, Landroid/util/SparseArray;

    iget p3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    invoke-direct {p1, p3}, Landroid/util/SparseArray;-><init>(I)V

    iput-object p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    :goto_d1
    iget p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    :goto_d3
    if-ge v0, p1, :cond_f8

    aget-object p3, p2, v0

    if-eqz p3, :cond_ed

    aget-object p3, p2, v0

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object p3

    if-eqz p3, :cond_e7

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    invoke-virtual {v1, v0, p3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_ed

    :cond_e7
    iget-object p3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    aget-object v1, p2, v0

    aput-object v1, p3, v0

    :cond_ed
    :goto_ed
    add-int/lit8 v0, v0, 0x1

    goto :goto_d3

    :cond_f0
    const/16 p1, 0xa

    new-array p1, p1, [Landroid/graphics/drawable/Drawable;

    iput-object p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    iput v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    :cond_f8
    return-void
.end method

.method private createAllFutures()V
    .registers 7

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    if-eqz v0, :cond_2f

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_b
    if-ge v1, v0, :cond_2c

    iget-object v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    invoke-virtual {v3, v1}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/Drawable$ConstantState;

    iget-object v4, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    iget-object v5, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mSourceRes:Landroid/content/res/Resources;

    invoke-virtual {v3, v5}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-direct {p0, v3}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->prepareDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    aput-object v3, v4, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_2c
    const/4 v0, 0x0

    iput-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    :cond_2f
    return-void
.end method

.method private prepareDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;
    .registers 4

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_b

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mLayoutDirection:I

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    :cond_b
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mOwner:Landroid/support/v7/graphics/drawable/DrawableContainer;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    return-object p1
.end method


# virtual methods
.method public final addChild(Landroid/graphics/drawable/Drawable;)I
    .registers 6

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    array-length v1, v1

    if-lt v0, v1, :cond_c

    add-int/lit8 v1, v0, 0xa

    invoke-virtual {p0, v0, v1}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->growArray(II)V

    :cond_c
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v1}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    iget-object v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mOwner:Landroid/support/v7/graphics/drawable/DrawableContainer;

    invoke-virtual {p1, v3}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    iget-object v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    aput-object p1, v3, v0

    iget v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    add-int/2addr v3, v1

    iput v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChildrenChangingConfigurations:I

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result p1

    or-int/2addr p1, v1

    iput p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChildrenChangingConfigurations:I

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->invalidateCache()V

    const/4 p1, 0x0

    iput-object p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantPadding:Landroid/graphics/Rect;

    iput-boolean v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedPadding:Z

    iput-boolean v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantSize:Z

    iput-boolean v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantState:Z

    return v0
.end method

.method final applyTheme(Landroid/content/res/Resources$Theme;)V
    .registers 7
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x15
    .end annotation

    if-eqz p1, :cond_32

    invoke-direct {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->createAllFutures()V

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    :goto_a
    if-ge v2, v0, :cond_2b

    aget-object v3, v1, v2

    if-eqz v3, :cond_28

    aget-object v3, v1, v2

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->canApplyTheme()Z

    move-result v3

    if-eqz v3, :cond_28

    aget-object v3, v1, v2

    invoke-virtual {v3, p1}, Landroid/graphics/drawable/Drawable;->applyTheme(Landroid/content/res/Resources$Theme;)V

    iget v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChildrenChangingConfigurations:I

    aget-object v4, v1, v2

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v4

    or-int/2addr v3, v4

    iput v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChildrenChangingConfigurations:I

    :cond_28
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_2b
    invoke-virtual {p1}, Landroid/content/res/Resources$Theme;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->updateDensity(Landroid/content/res/Resources;)V

    :cond_32
    return-void
.end method

.method public canApplyTheme()Z
    .registers 7
    .annotation build Landroid/support/annotation/RequiresApi;
        value = 0x15
    .end annotation

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_6
    if-ge v3, v0, :cond_28

    aget-object v4, v1, v3

    const/4 v5, 0x1

    if-eqz v4, :cond_14

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->canApplyTheme()Z

    move-result v4

    if-eqz v4, :cond_25

    return v5

    :cond_14
    iget-object v4, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    invoke-virtual {v4, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/drawable/Drawable$ConstantState;

    if-eqz v4, :cond_25

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable$ConstantState;->canApplyTheme()Z

    move-result v4

    if-eqz v4, :cond_25

    return v5

    :cond_25
    add-int/lit8 v3, v3, 0x1

    goto :goto_6

    :cond_28
    return v2
.end method

.method public declared-synchronized canConstantState()Z
    .registers 7

    monitor-enter p0

    :try_start_1
    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantState:Z

    if-eqz v0, :cond_9

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCanConstantState:Z
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_2a

    monitor-exit p0

    return v0

    :cond_9
    :try_start_9
    invoke-direct {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->createAllFutures()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantState:Z

    iget v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_15
    if-ge v4, v1, :cond_26

    aget-object v5, v2, v4

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    move-result-object v5

    if-nez v5, :cond_23

    iput-boolean v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCanConstantState:Z
    :try_end_21
    .catchall {:try_start_9 .. :try_end_21} :catchall_2a

    monitor-exit p0

    return v3

    :cond_23
    add-int/lit8 v4, v4, 0x1

    goto :goto_15

    :cond_26
    :try_start_26
    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCanConstantState:Z
    :try_end_28
    .catchall {:try_start_26 .. :try_end_28} :catchall_2a

    monitor-exit p0

    return v0

    :catchall_2a
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method final clearMutated()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mMutated:Z

    return-void
.end method

.method protected computeConstantSize()V
    .registers 7

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantSize:Z

    invoke-direct {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->createAllFutures()V

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    const/4 v2, -0x1

    iput v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantHeight:I

    iput v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantWidth:I

    const/4 v2, 0x0

    iput v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumHeight:I

    iput v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumWidth:I

    :goto_14
    if-ge v2, v0, :cond_43

    aget-object v3, v1, v2

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v4

    iget v5, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantWidth:I

    if-le v4, v5, :cond_22

    iput v4, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantWidth:I

    :cond_22
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    iget v5, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantHeight:I

    if-le v4, v5, :cond_2c

    iput v4, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantHeight:I

    :cond_2c
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    move-result v4

    iget v5, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumWidth:I

    if-le v4, v5, :cond_36

    iput v4, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumWidth:I

    :cond_36
    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    move-result v3

    iget v4, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumHeight:I

    if-le v3, v4, :cond_40

    iput v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumHeight:I

    :cond_40
    add-int/lit8 v2, v2, 0x1

    goto :goto_14

    :cond_43
    return-void
.end method

.method final getCapacity()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    array-length v0, v0

    return v0
.end method

.method public getChangingConfigurations()I
    .registers 3

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChangingConfigurations:I

    iget v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mChildrenChangingConfigurations:I

    or-int/2addr v0, v1

    return v0
.end method

.method public final getChild(I)Landroid/graphics/drawable/Drawable;
    .registers 6

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    aget-object v0, v0, p1

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    const/4 v1, 0x0

    if-eqz v0, :cond_3a

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->indexOfKey(I)I

    move-result v0

    if-ltz v0, :cond_3a

    iget-object v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/Drawable$ConstantState;

    iget-object v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mSourceRes:Landroid/content/res/Resources;

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable(Landroid/content/res/Resources;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-direct {p0, v2}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->prepareDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    aput-object v2, v3, p1

    iget-object p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    invoke-virtual {p1, v0}, Landroid/util/SparseArray;->removeAt(I)V

    iget-object p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    invoke-virtual {p1}, Landroid/util/SparseArray;->size()I

    move-result p1

    if-nez p1, :cond_39

    iput-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawableFutures:Landroid/util/SparseArray;

    :cond_39
    return-object v2

    :cond_3a
    return-object v1
.end method

.method public final getChildCount()I
    .registers 2

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    return v0
.end method

.method public final getConstantHeight()I
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantSize:Z

    if-nez v0, :cond_7

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->computeConstantSize()V

    :cond_7
    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantHeight:I

    return v0
.end method

.method public final getConstantMinimumHeight()I
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantSize:Z

    if-nez v0, :cond_7

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->computeConstantSize()V

    :cond_7
    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumHeight:I

    return v0
.end method

.method public final getConstantMinimumWidth()I
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantSize:Z

    if-nez v0, :cond_7

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->computeConstantSize()V

    :cond_7
    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantMinimumWidth:I

    return v0
.end method

.method public final getConstantPadding()Landroid/graphics/Rect;
    .registers 9

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mVariablePadding:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_6

    return-object v1

    :cond_6
    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantPadding:Landroid/graphics/Rect;

    if-nez v0, :cond_60

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedPadding:Z

    if-eqz v0, :cond_f

    goto :goto_60

    :cond_f
    invoke-direct {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->createAllFutures()V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iget v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    const/4 v4, 0x0

    move-object v5, v1

    const/4 v1, 0x0

    :goto_1e
    if-ge v1, v2, :cond_5a

    aget-object v6, v3, v1

    invoke-virtual {v6, v0}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result v6

    if-eqz v6, :cond_57

    if-nez v5, :cond_2f

    new-instance v5, Landroid/graphics/Rect;

    invoke-direct {v5, v4, v4, v4, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    :cond_2f
    iget v6, v0, Landroid/graphics/Rect;->left:I

    iget v7, v5, Landroid/graphics/Rect;->left:I

    if-le v6, v7, :cond_39

    iget v6, v0, Landroid/graphics/Rect;->left:I

    iput v6, v5, Landroid/graphics/Rect;->left:I

    :cond_39
    iget v6, v0, Landroid/graphics/Rect;->top:I

    iget v7, v5, Landroid/graphics/Rect;->top:I

    if-le v6, v7, :cond_43

    iget v6, v0, Landroid/graphics/Rect;->top:I

    iput v6, v5, Landroid/graphics/Rect;->top:I

    :cond_43
    iget v6, v0, Landroid/graphics/Rect;->right:I

    iget v7, v5, Landroid/graphics/Rect;->right:I

    if-le v6, v7, :cond_4d

    iget v6, v0, Landroid/graphics/Rect;->right:I

    iput v6, v5, Landroid/graphics/Rect;->right:I

    :cond_4d
    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    iget v7, v5, Landroid/graphics/Rect;->bottom:I

    if-le v6, v7, :cond_57

    iget v6, v0, Landroid/graphics/Rect;->bottom:I

    iput v6, v5, Landroid/graphics/Rect;->bottom:I

    :cond_57
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    :cond_5a
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedPadding:Z

    iput-object v5, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantPadding:Landroid/graphics/Rect;

    return-object v5

    :cond_60
    :goto_60
    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantPadding:Landroid/graphics/Rect;

    return-object v0
.end method

.method public final getConstantWidth()I
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantSize:Z

    if-nez v0, :cond_7

    invoke-virtual {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->computeConstantSize()V

    :cond_7
    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantWidth:I

    return v0
.end method

.method public final getEnterFadeDuration()I
    .registers 2

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mEnterFadeDuration:I

    return v0
.end method

.method public final getExitFadeDuration()I
    .registers 2

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mExitFadeDuration:I

    return v0
.end method

.method public final getOpacity()I
    .registers 7

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedOpacity:Z

    if-eqz v0, :cond_7

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mOpacity:I

    return v0

    :cond_7
    invoke-direct {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->createAllFutures()V

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    if-lez v0, :cond_18

    const/4 v2, 0x0

    aget-object v2, v1, v2

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v2

    goto :goto_19

    :cond_18
    const/4 v2, -0x2

    :goto_19
    const/4 v3, 0x1

    move v4, v2

    const/4 v2, 0x1

    :goto_1c
    if-ge v2, v0, :cond_2b

    aget-object v5, v1, v2

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getOpacity()I

    move-result v5

    invoke-static {v4, v5}, Landroid/graphics/drawable/Drawable;->resolveOpacity(II)I

    move-result v4

    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    :cond_2b
    iput v4, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mOpacity:I

    iput-boolean v3, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedOpacity:Z

    return v4
.end method

.method public growArray(II)V
    .registers 5

    new-array p2, p2, [Landroid/graphics/drawable/Drawable;

    iget-object v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    const/4 v1, 0x0

    invoke-static {v0, v1, p2, v1, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iput-object p2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method invalidateCache()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedOpacity:Z

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedStateful:Z

    return-void
.end method

.method public final isConstantSize()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantSize:Z

    return v0
.end method

.method public final isStateful()Z
    .registers 7

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedStateful:Z

    if-eqz v0, :cond_7

    iget-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mStateful:Z

    return v0

    :cond_7
    invoke-direct {p0}, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->createAllFutures()V

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_10
    const/4 v4, 0x1

    if-ge v3, v0, :cond_20

    aget-object v5, v1, v3

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v5

    if-eqz v5, :cond_1d

    const/4 v2, 0x1

    goto :goto_20

    :cond_1d
    add-int/lit8 v3, v3, 0x1

    goto :goto_10

    :cond_20
    :goto_20
    iput-boolean v2, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mStateful:Z

    iput-boolean v4, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedStateful:Z

    return v2
.end method

.method mutate()V
    .registers 5

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    :goto_5
    if-ge v2, v0, :cond_13

    aget-object v3, v1, v2

    if-eqz v3, :cond_10

    aget-object v3, v1, v2

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    :cond_10
    add-int/lit8 v2, v2, 0x1

    goto :goto_5

    :cond_13
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mMutated:Z

    return-void
.end method

.method public final setConstantSize(Z)V
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mConstantSize:Z

    return-void
.end method

.method public final setEnterFadeDuration(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mEnterFadeDuration:I

    return-void
.end method

.method public final setExitFadeDuration(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mExitFadeDuration:I

    return-void
.end method

.method final setLayoutDirection(II)Z
    .registers 10

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mNumChildren:I

    iget-object v1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDrawables:[Landroid/graphics/drawable/Drawable;

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_7
    if-ge v3, v0, :cond_21

    aget-object v5, v1, v3

    if-eqz v5, :cond_1e

    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x17

    if-lt v5, v6, :cond_1a

    aget-object v5, v1, v3

    invoke-virtual {v5, p1}, Landroid/graphics/drawable/Drawable;->setLayoutDirection(I)Z

    move-result v5

    goto :goto_1b

    :cond_1a
    const/4 v5, 0x0

    :goto_1b
    if-ne v3, p2, :cond_1e

    move v4, v5

    :cond_1e
    add-int/lit8 v3, v3, 0x1

    goto :goto_7

    :cond_21
    iput p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mLayoutDirection:I

    return v4
.end method

.method public final setVariablePadding(Z)V
    .registers 2

    iput-boolean p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mVariablePadding:Z

    return-void
.end method

.method final updateDensity(Landroid/content/res/Resources;)V
    .registers 3

    if-eqz p1, :cond_15

    iput-object p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mSourceRes:Landroid/content/res/Resources;

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDensity:I

    invoke-static {p1, v0}, Landroid/support/v7/graphics/drawable/DrawableContainer;->resolveDensity(Landroid/content/res/Resources;I)I

    move-result p1

    iget v0, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDensity:I

    iput p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mDensity:I

    if-eq v0, p1, :cond_15

    const/4 p1, 0x0

    iput-boolean p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedConstantSize:Z

    iput-boolean p1, p0, Landroid/support/v7/graphics/drawable/DrawableContainer$DrawableContainerState;->mCheckedPadding:Z

    :cond_15
    return-void
.end method
