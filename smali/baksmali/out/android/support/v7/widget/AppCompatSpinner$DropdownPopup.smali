.class Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;
.super Landroid/support/v7/widget/ListPopupWindow;
.source "AppCompatSpinner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/widget/AppCompatSpinner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DropdownPopup"
.end annotation


# instance fields
.field mAdapter:Landroid/widget/ListAdapter;

.field private mHintText:Ljava/lang/CharSequence;

.field private final mVisibleRect:Landroid/graphics/Rect;

.field final synthetic this$0:Landroid/support/v7/widget/AppCompatSpinner;


# direct methods
.method public constructor <init>(Landroid/support/v7/widget/AppCompatSpinner;Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-direct {p0, p2, p3, p4}, Landroid/support/v7/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mVisibleRect:Landroid/graphics/Rect;

    invoke-virtual {p0, p1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setAnchorView(Landroid/view/View;)V

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setModal(Z)V

    const/4 p2, 0x0

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setPromptPosition(I)V

    new-instance p2, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$1;

    invoke-direct {p2, p0, p1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$1;-><init>(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;Landroid/support/v7/widget/AppCompatSpinner;)V

    invoke-virtual {p0, p2}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-void
.end method

.method static synthetic access$001(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;)V
    .registers 1

    invoke-super {p0}, Landroid/support/v7/widget/ListPopupWindow;->show()V

    return-void
.end method


# virtual methods
.method computeContentWidth()V
    .registers 8

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_26

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget-object v1, v1, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-static {v0}, Landroid/support/v7/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_1e

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget-object v0, v0, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    :goto_1c
    move v1, v0

    goto :goto_32

    :cond_1e
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget-object v0, v0, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    neg-int v0, v0

    goto :goto_1c

    :cond_26
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget-object v0, v0, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget-object v2, v2, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    iput v1, v2, Landroid/graphics/Rect;->right:I

    iput v1, v0, Landroid/graphics/Rect;->left:I

    :goto_32
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner;->getPaddingLeft()I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v2}, Landroid/support/v7/widget/AppCompatSpinner;->getPaddingRight()I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v3}, Landroid/support/v7/widget/AppCompatSpinner;->getWidth()I

    move-result v3

    iget-object v4, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget v4, v4, Landroid/support/v7/widget/AppCompatSpinner;->mDropDownWidth:I

    const/4 v5, -0x2

    if-ne v4, v5, :cond_85

    iget-object v4, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget-object v5, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mAdapter:Landroid/widget/ListAdapter;

    check-cast v5, Landroid/widget/SpinnerAdapter;

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/support/v7/widget/AppCompatSpinner;->compatMeasureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    move-result v4

    iget-object v5, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v5}, Landroid/support/v7/widget/AppCompatSpinner;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v6, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget-object v6, v6, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->left:I

    sub-int/2addr v5, v6

    iget-object v6, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget-object v6, v6, Landroid/support/v7/widget/AppCompatSpinner;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    sub-int/2addr v5, v6

    if-le v4, v5, :cond_7a

    move v4, v5

    :cond_7a
    sub-int v5, v3, v0

    sub-int/2addr v5, v2

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setContentWidth(I)V

    goto :goto_9a

    :cond_85
    iget-object v4, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget v4, v4, Landroid/support/v7/widget/AppCompatSpinner;->mDropDownWidth:I

    const/4 v5, -0x1

    if-ne v4, v5, :cond_93

    sub-int v4, v3, v0

    sub-int/2addr v4, v2

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setContentWidth(I)V

    goto :goto_9a

    :cond_93
    iget-object v4, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    iget v4, v4, Landroid/support/v7/widget/AppCompatSpinner;->mDropDownWidth:I

    invoke-virtual {p0, v4}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setContentWidth(I)V

    :goto_9a
    iget-object v4, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-static {v4}, Landroid/support/v7/widget/ViewUtils;->isLayoutRtl(Landroid/view/View;)Z

    move-result v4

    if-eqz v4, :cond_aa

    sub-int/2addr v3, v2

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getWidth()I

    move-result v0

    sub-int/2addr v3, v0

    add-int/2addr v1, v3

    goto :goto_ab

    :cond_aa
    add-int/2addr v1, v0

    :goto_ab
    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setHorizontalOffset(I)V

    return-void
.end method

.method public getHintText()Ljava/lang/CharSequence;
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mHintText:Ljava/lang/CharSequence;

    return-object v0
.end method

.method isVisibleToUser(Landroid/view/View;)Z
    .registers 3

    invoke-static {p1}, Landroid/support/v4/view/ViewCompat;->isAttachedToWindow(Landroid/view/View;)Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mVisibleRect:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result p1

    if-eqz p1, :cond_10

    const/4 p1, 0x1

    goto :goto_11

    :cond_10
    const/4 p1, 0x0

    :goto_11
    return p1
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/support/v7/widget/ListPopupWindow;->setAdapter(Landroid/widget/ListAdapter;)V

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mAdapter:Landroid/widget/ListAdapter;

    return-void
.end method

.method public setPromptText(Ljava/lang/CharSequence;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->mHintText:Ljava/lang/CharSequence;

    return-void
.end method

.method public show()V
    .registers 4

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->isShowing()Z

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->computeContentWidth()V

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setInputMethodMode(I)V

    invoke-super {p0}, Landroid/support/v7/widget/ListPopupWindow;->show()V

    invoke-virtual {p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->getListView()Landroid/widget/ListView;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setChoiceMode(I)V

    iget-object v1, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v1}, Landroid/support/v7/widget/AppCompatSpinner;->getSelectedItemPosition()I

    move-result v1

    invoke-virtual {p0, v1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setSelection(I)V

    if-eqz v0, :cond_22

    return-void

    :cond_22
    iget-object v0, p0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->this$0:Landroid/support/v7/widget/AppCompatSpinner;

    invoke-virtual {v0}, Landroid/support/v7/widget/AppCompatSpinner;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    if-eqz v0, :cond_3a

    new-instance v1, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$2;

    invoke-direct {v1, p0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$2;-><init>(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    new-instance v0, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$3;

    invoke-direct {v0, p0, v1}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup$3;-><init>(Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    invoke-virtual {p0, v0}, Landroid/support/v7/widget/AppCompatSpinner$DropdownPopup;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    :cond_3a
    return-void
.end method
