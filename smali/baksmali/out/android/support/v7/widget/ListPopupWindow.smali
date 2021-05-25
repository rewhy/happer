.class public Landroid/support/v7/widget/ListPopupWindow;
.super Ljava/lang/Object;
.source "ListPopupWindow.java"

# interfaces
.implements Landroid/support/v7/view/menu/ShowableListMenu;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;,
        Landroid/support/v7/widget/ListPopupWindow$PopupTouchInterceptor;,
        Landroid/support/v7/widget/ListPopupWindow$ResizePopupRunnable;,
        Landroid/support/v7/widget/ListPopupWindow$ListSelectorHider;,
        Landroid/support/v7/widget/ListPopupWindow$PopupDataSetObserver;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field static final EXPAND_LIST_TIMEOUT:I = 0xfa

.field public static final INPUT_METHOD_FROM_FOCUSABLE:I = 0x0

.field public static final INPUT_METHOD_NEEDED:I = 0x1

.field public static final INPUT_METHOD_NOT_NEEDED:I = 0x2

.field public static final MATCH_PARENT:I = -0x1

.field public static final POSITION_PROMPT_ABOVE:I = 0x0

.field public static final POSITION_PROMPT_BELOW:I = 0x1

.field private static final TAG:Ljava/lang/String; = "ListPopupWindow"

.field public static final WRAP_CONTENT:I = -0x2

.field private static sClipToWindowEnabledMethod:Ljava/lang/reflect/Method;

.field private static sGetMaxAvailableHeightMethod:Ljava/lang/reflect/Method;

.field private static sSetEpicenterBoundsMethod:Ljava/lang/reflect/Method;


# instance fields
.field private mAdapter:Landroid/widget/ListAdapter;

.field private mContext:Landroid/content/Context;

.field private mDropDownAlwaysVisible:Z

.field private mDropDownAnchorView:Landroid/view/View;

.field private mDropDownGravity:I

.field private mDropDownHeight:I

.field private mDropDownHorizontalOffset:I

.field mDropDownList:Landroid/support/v7/widget/DropDownListView;

.field private mDropDownListHighlight:Landroid/graphics/drawable/Drawable;

.field private mDropDownVerticalOffset:I

.field private mDropDownVerticalOffsetSet:Z

.field private mDropDownWidth:I

.field private mDropDownWindowLayoutType:I

.field private mEpicenterBounds:Landroid/graphics/Rect;

.field private mForceIgnoreOutsideTouch:Z

.field final mHandler:Landroid/os/Handler;

.field private final mHideSelector:Landroid/support/v7/widget/ListPopupWindow$ListSelectorHider;

.field private mIsAnimatedFromAnchor:Z

.field private mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

.field private mItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

.field mListItemExpandMaximum:I

.field private mModal:Z

.field private mObserver:Landroid/database/DataSetObserver;

.field private mOverlapAnchor:Z

.field private mOverlapAnchorSet:Z

.field mPopup:Landroid/widget/PopupWindow;

.field private mPromptPosition:I

.field private mPromptView:Landroid/view/View;

.field final mResizePopupRunnable:Landroid/support/v7/widget/ListPopupWindow$ResizePopupRunnable;

.field private final mScrollListener:Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;

.field private mShowDropDownRunnable:Ljava/lang/Runnable;

.field private final mTempRect:Landroid/graphics/Rect;

.field private final mTouchInterceptor:Landroid/support/v7/widget/ListPopupWindow$PopupTouchInterceptor;


# direct methods
.method static constructor <clinit>()V
    .registers 7

    const/4 v0, 0x0

    const/4 v1, 0x1

    :try_start_2
    const-class v2, Landroid/widget/PopupWindow;

    const-string v3, "setClipToScreenEnabled"

    new-array v4, v1, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v0

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Landroid/support/v7/widget/ListPopupWindow;->sClipToWindowEnabledMethod:Ljava/lang/reflect/Method;
    :try_end_12
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_12} :catch_13

    goto :goto_1a

    :catch_13
    const-string v2, "ListPopupWindow"

    const-string v3, "Could not find method setClipToScreenEnabled() on PopupWindow. Oh well."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1a
    :try_start_1a
    const-class v2, Landroid/widget/PopupWindow;

    const-string v3, "getMaxAvailableHeight"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Class;

    const-class v5, Landroid/view/View;

    aput-object v5, v4, v0

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    const/4 v5, 0x2

    sget-object v6, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v6, v4, v5

    invoke-virtual {v2, v3, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    sput-object v2, Landroid/support/v7/widget/ListPopupWindow;->sGetMaxAvailableHeightMethod:Ljava/lang/reflect/Method;
    :try_end_34
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1a .. :try_end_34} :catch_35

    goto :goto_3c

    :catch_35
    const-string v2, "ListPopupWindow"

    const-string v3, "Could not find method getMaxAvailableHeight(View, int, boolean) on PopupWindow. Oh well."

    invoke-static {v2, v3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3c
    :try_start_3c
    const-class v2, Landroid/widget/PopupWindow;

    const-string v3, "setEpicenterBounds"

    new-array v1, v1, [Ljava/lang/Class;

    const-class v4, Landroid/graphics/Rect;

    aput-object v4, v1, v0

    invoke-virtual {v2, v3, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Landroid/support/v7/widget/ListPopupWindow;->sSetEpicenterBoundsMethod:Ljava/lang/reflect/Method;
    :try_end_4c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_3c .. :try_end_4c} :catch_4d

    goto :goto_54

    :catch_4d
    const-string v0, "ListPopupWindow"

    const-string v1, "Could not find method setEpicenterBounds(Rect) on PopupWindow. Oh well."

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    sget v0, Landroid/support/v7/appcompat/R$attr;->listPopupWindowStyle:I

    const/4 v1, 0x0

    invoke-direct {p0, p1, v1, v0}, Landroid/support/v7/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    sget v0, Landroid/support/v7/appcompat/R$attr;->listPopupWindowStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroid/support/v7/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Landroid/support/v7/widget/ListPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 9
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param
    .param p4    # I
        .annotation build Landroid/support/annotation/StyleRes;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x2

    iput v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    iput v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    const/16 v0, 0x3ea

    iput v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWindowLayoutType:I

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mIsAnimatedFromAnchor:Z

    const/4 v1, 0x0

    iput v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownGravity:I

    iput-boolean v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    iput-boolean v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mForceIgnoreOutsideTouch:Z

    const v2, 0x7fffffff

    iput v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mListItemExpandMaximum:I

    iput v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptPosition:I

    new-instance v2, Landroid/support/v7/widget/ListPopupWindow$ResizePopupRunnable;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/ListPopupWindow$ResizePopupRunnable;-><init>(Landroid/support/v7/widget/ListPopupWindow;)V

    iput-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mResizePopupRunnable:Landroid/support/v7/widget/ListPopupWindow$ResizePopupRunnable;

    new-instance v2, Landroid/support/v7/widget/ListPopupWindow$PopupTouchInterceptor;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/ListPopupWindow$PopupTouchInterceptor;-><init>(Landroid/support/v7/widget/ListPopupWindow;)V

    iput-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mTouchInterceptor:Landroid/support/v7/widget/ListPopupWindow$PopupTouchInterceptor;

    new-instance v2, Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;-><init>(Landroid/support/v7/widget/ListPopupWindow;)V

    iput-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mScrollListener:Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;

    new-instance v2, Landroid/support/v7/widget/ListPopupWindow$ListSelectorHider;

    invoke-direct {v2, p0}, Landroid/support/v7/widget/ListPopupWindow$ListSelectorHider;-><init>(Landroid/support/v7/widget/ListPopupWindow;)V

    iput-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mHideSelector:Landroid/support/v7/widget/ListPopupWindow$ListSelectorHider;

    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    iput-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iput-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    new-instance v2, Landroid/os/Handler;

    invoke-virtual {p1}, Landroid/content/Context;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    sget-object v2, Landroid/support/v7/appcompat/R$styleable;->ListPopupWindow:[I

    invoke-virtual {p1, p2, v2, p3, p4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v2

    sget v3, Landroid/support/v7/appcompat/R$styleable;->ListPopupWindow_android_dropDownHorizontalOffset:I

    invoke-virtual {v2, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v3

    iput v3, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    sget v3, Landroid/support/v7/appcompat/R$styleable;->ListPopupWindow_android_dropDownVerticalOffset:I

    invoke-virtual {v2, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    iput v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    iget v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    if-eqz v1, :cond_69

    iput-boolean v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffsetSet:Z

    :cond_69
    invoke-virtual {v2}, Landroid/content/res/TypedArray;->recycle()V

    new-instance v1, Landroid/support/v7/widget/AppCompatPopupWindow;

    invoke-direct {v1, p1, p2, p3, p4}, Landroid/support/v7/widget/AppCompatPopupWindow;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    iput-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    iget-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {p1, v0}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    return-void
.end method

.method private buildDropDown()I
    .registers 13

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    const/high16 v1, -0x80000000

    const/4 v2, -0x1

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v0, :cond_c6

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    new-instance v5, Landroid/support/v7/widget/ListPopupWindow$2;

    invoke-direct {v5, p0}, Landroid/support/v7/widget/ListPopupWindow$2;-><init>(Landroid/support/v7/widget/ListPopupWindow;)V

    iput-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mShowDropDownRunnable:Ljava/lang/Runnable;

    iget-boolean v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mModal:Z

    xor-int/2addr v5, v3

    invoke-virtual {p0, v0, v5}, Landroid/support/v7/widget/ListPopupWindow;->createDropDownListView(Landroid/content/Context;Z)Landroid/support/v7/widget/DropDownListView;

    move-result-object v5

    iput-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownListHighlight:Landroid/graphics/drawable/Drawable;

    if-eqz v5, :cond_26

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownListHighlight:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/DropDownListView;->setSelector(Landroid/graphics/drawable/Drawable;)V

    :cond_26
    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/DropDownListView;->setAdapter(Landroid/widget/ListAdapter;)V

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/DropDownListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v5, v3}, Landroid/support/v7/widget/DropDownListView;->setFocusable(Z)V

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v5, v3}, Landroid/support/v7/widget/DropDownListView;->setFocusableInTouchMode(Z)V

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    new-instance v6, Landroid/support/v7/widget/ListPopupWindow$3;

    invoke-direct {v6, p0}, Landroid/support/v7/widget/ListPopupWindow$3;-><init>(Landroid/support/v7/widget/ListPopupWindow;)V

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/DropDownListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mScrollListener:Landroid/support/v7/widget/ListPopupWindow$PopupScrollListener;

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/DropDownListView;->setOnScrollListener(Landroid/widget/AbsListView$OnScrollListener;)V

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    if-eqz v5, :cond_5a

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    invoke-virtual {v5, v6}, Landroid/support/v7/widget/DropDownListView;->setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V

    :cond_5a
    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    if-eqz v6, :cond_bf

    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v8, 0x3f800000    # 1.0f

    invoke-direct {v0, v2, v4, v8}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    iget v8, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptPosition:I

    packed-switch v8, :pswitch_data_190

    const-string v0, "ListPopupWindow"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Invalid hint position "

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v8, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptPosition:I

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_9a

    :pswitch_8d
    invoke-virtual {v7, v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    goto :goto_9a

    :pswitch_94
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    invoke-virtual {v7, v5, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :goto_9a
    iget v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    if-ltz v0, :cond_a3

    iget v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    const/high16 v5, -0x80000000

    goto :goto_a5

    :cond_a3
    const/4 v0, 0x0

    const/4 v5, 0x0

    :goto_a5
    invoke-static {v0, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v0

    invoke-virtual {v6, v0, v4}, Landroid/view/View;->measure(II)V

    invoke-virtual {v6}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v6}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    iget v6, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v5, v6

    iget v0, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v5, v0

    move v0, v5

    move-object v5, v7

    goto :goto_c0

    :cond_bf
    const/4 v0, 0x0

    :goto_c0
    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v6, v5}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    goto :goto_e4

    :cond_c6
    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getContentView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    if-eqz v0, :cond_e3

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v0

    iget v6, v5, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    add-int/2addr v0, v6

    iget v5, v5, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    add-int/2addr v0, v5

    goto :goto_e4

    :cond_e3
    const/4 v0, 0x0

    :goto_e4
    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v5}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    if-eqz v5, :cond_106

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v5, v6

    iget-boolean v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffsetSet:Z

    if-nez v6, :cond_10c

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->top:I

    neg-int v6, v6

    iput v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    goto :goto_10c

    :cond_106
    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->setEmpty()V

    const/4 v5, 0x0

    :cond_10c
    :goto_10c
    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v6}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    move-result v6

    const/4 v7, 0x2

    if-ne v6, v7, :cond_116

    goto :goto_117

    :cond_116
    const/4 v3, 0x0

    :goto_117
    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v4

    iget v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    invoke-direct {p0, v4, v6, v3}, Landroid/support/v7/widget/ListPopupWindow;->getMaxAvailableHeight(Landroid/view/View;IZ)I

    move-result v3

    iget-boolean v4, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    if-nez v4, :cond_18d

    iget v4, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    if-ne v4, v2, :cond_12a

    goto :goto_18d

    :cond_12a
    iget v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    const/high16 v4, 0x40000000    # 2.0f

    packed-switch v2, :pswitch_data_198

    iget v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    invoke-static {v1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    :goto_137
    move v7, v1

    goto :goto_16f

    :pswitch_139
    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, v6

    sub-int/2addr v1, v2

    invoke-static {v1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    goto :goto_137

    :pswitch_154
    iget-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mContext:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v4, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->left:I

    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v6, v6, Landroid/graphics/Rect;->right:I

    add-int/2addr v4, v6

    sub-int/2addr v2, v4

    invoke-static {v2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    goto :goto_137

    :goto_16f
    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    const/4 v8, 0x0

    const/4 v9, -0x1

    sub-int v10, v3, v0

    const/4 v11, -0x1

    invoke-virtual/range {v6 .. v11}, Landroid/support/v7/widget/DropDownListView;->measureHeightOfChildrenCompat(IIIII)I

    move-result v1

    if-lez v1, :cond_18b

    iget-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v2}, Landroid/support/v7/widget/DropDownListView;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v3}, Landroid/support/v7/widget/DropDownListView;->getPaddingBottom()I

    move-result v3

    add-int/2addr v2, v3

    add-int/2addr v5, v2

    add-int/2addr v0, v5

    :cond_18b
    add-int/2addr v1, v0

    return v1

    :cond_18d
    :goto_18d
    add-int/2addr v3, v5

    return v3

    nop

    :pswitch_data_190
    .packed-switch 0x0
        :pswitch_94
        :pswitch_8d
    .end packed-switch

    :pswitch_data_198
    .packed-switch -0x2
        :pswitch_154
        :pswitch_139
    .end packed-switch
.end method

.method private getMaxAvailableHeight(Landroid/view/View;IZ)I
    .registers 9

    sget-object v0, Landroid/support/v7/widget/ListPopupWindow;->sGetMaxAvailableHeightMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_2e

    :try_start_4
    sget-object v0, Landroid/support/v7/widget/ListPopupWindow;->sGetMaxAvailableHeightMethod:Ljava/lang/reflect/Method;

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p3

    aput-object p3, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Integer;

    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    move-result p3
    :try_end_26
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_26} :catch_27

    return p3

    :catch_27
    const-string p3, "ListPopupWindow"

    const-string v0, "Could not call getMaxAvailableHeightMethod(View, int, boolean) on PopupWindow. Using the public version."

    invoke-static {p3, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2e
    iget-object p3, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {p3, p1, p2}, Landroid/widget/PopupWindow;->getMaxAvailableHeight(Landroid/view/View;I)I

    move-result p1

    return p1
.end method

.method private static isConfirmKey(I)Z
    .registers 2

    const/16 v0, 0x42

    if-eq p0, v0, :cond_b

    const/16 v0, 0x17

    if-ne p0, v0, :cond_9

    goto :goto_b

    :cond_9
    const/4 p0, 0x0

    goto :goto_c

    :cond_b
    :goto_b
    const/4 p0, 0x1

    :goto_c
    return p0
.end method

.method private removePromptView()V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    if-eqz v0, :cond_15

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v1, v0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_15

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_15
    return-void
.end method

.method private setPopupClipToScreenEnabled(Z)V
    .registers 6

    sget-object v0, Landroid/support/v7/widget/ListPopupWindow;->sClipToWindowEnabledMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_1d

    :try_start_4
    sget-object v0, Landroid/support/v7/widget/ListPopupWindow;->sClipToWindowEnabledMethod:Ljava/lang/reflect/Method;

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_15} :catch_16

    goto :goto_1d

    :catch_16
    const-string p1, "ListPopupWindow"

    const-string v0, "Could not call setClipToScreenEnabled() on PopupWindow. Oh well."

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1d
    :goto_1d
    return-void
.end method


# virtual methods
.method public clearListSelection()V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    if-eqz v0, :cond_b

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/DropDownListView;->setListSelectionHidden(Z)V

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->requestLayout()V

    :cond_b
    return-void
.end method

.method public createDragToOpenListener(Landroid/view/View;)Landroid/view/View$OnTouchListener;
    .registers 3

    new-instance v0, Landroid/support/v7/widget/ListPopupWindow$1;

    invoke-direct {v0, p0, p1}, Landroid/support/v7/widget/ListPopupWindow$1;-><init>(Landroid/support/v7/widget/ListPopupWindow;Landroid/view/View;)V

    return-object v0
.end method

.method createDropDownListView(Landroid/content/Context;Z)Landroid/support/v7/widget/DropDownListView;
    .registers 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    new-instance v0, Landroid/support/v7/widget/DropDownListView;

    invoke-direct {v0, p1, p2}, Landroid/support/v7/widget/DropDownListView;-><init>(Landroid/content/Context;Z)V

    return-object v0
.end method

.method public dismiss()V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->dismiss()V

    invoke-direct {p0}, Landroid/support/v7/widget/ListPopupWindow;->removePromptView()V

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setContentView(Landroid/view/View;)V

    iput-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mResizePopupRunnable:Landroid/support/v7/widget/ListPopupWindow$ResizePopupRunnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    return-void
.end method

.method public getAnchorView()Landroid/view/View;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownAnchorView:Landroid/view/View;

    return-object v0
.end method

.method public getAnimationStyle()I
    .registers 2
    .annotation build Landroid/support/annotation/StyleRes;
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getAnimationStyle()I

    move-result v0

    return v0
.end method

.method public getBackground()Landroid/graphics/drawable/Drawable;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    return-object v0
.end method

.method public getHeight()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    return v0
.end method

.method public getHorizontalOffset()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    return v0
.end method

.method public getInputMethodMode()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    move-result v0

    return v0
.end method

.method public getListView()Landroid/widget/ListView;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    return-object v0
.end method

.method public getPromptPosition()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptPosition:I

    return v0
.end method

.method public getSelectedItem()Ljava/lang/Object;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return-object v0

    :cond_8
    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->getSelectedItem()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public getSelectedItemId()J
    .registers 3

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_9

    const-wide/high16 v0, -0x8000000000000000L

    return-wide v0

    :cond_9
    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->getSelectedItemId()J

    move-result-wide v0

    return-wide v0
.end method

.method public getSelectedItemPosition()I
    .registers 2

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, -0x1

    return v0

    :cond_8
    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->getSelectedItemPosition()I

    move-result v0

    return v0
.end method

.method public getSelectedView()Landroid/view/View;
    .registers 2
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v0, 0x0

    return-object v0

    :cond_8
    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->getSelectedView()Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getSoftInputMode()I
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getSoftInputMode()I

    move-result v0

    return v0
.end method

.method public getVerticalOffset()I
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffsetSet:Z

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    :cond_6
    iget v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    return v0
.end method

.method public getWidth()I
    .registers 2

    iget v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    return v0
.end method

.method public isDropDownAlwaysVisible()Z
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iget-boolean v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    return v0
.end method

.method public isInputMethodNotNeeded()Z
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getInputMethodMode()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_b

    const/4 v0, 0x1

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return v0
.end method

.method public isModal()Z
    .registers 2

    iget-boolean v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mModal:Z

    return v0
.end method

.method public isShowing()Z
    .registers 2

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v0

    return v0
.end method

.method public onKeyDown(ILandroid/view/KeyEvent;)Z
    .registers 12
    .param p2    # Landroid/view/KeyEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_a7

    const/16 v0, 0x3e

    if-eq p1, v0, :cond_a7

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->getSelectedItemPosition()I

    move-result v0

    if-gez v0, :cond_19

    invoke-static {p1}, Landroid/support/v7/widget/ListPopupWindow;->isConfirmKey(I)Z

    move-result v0

    if-nez v0, :cond_a7

    :cond_19
    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->getSelectedItemPosition()I

    move-result v0

    iget-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isAboveAnchor()Z

    move-result v2

    const/4 v3, 0x1

    xor-int/2addr v2, v3

    iget-object v4, p0, Landroid/support/v7/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    const v5, 0x7fffffff

    const/high16 v6, -0x80000000

    if-eqz v4, :cond_53

    invoke-interface {v4}, Landroid/widget/ListAdapter;->areAllItemsEnabled()Z

    move-result v5

    if-eqz v5, :cond_38

    const/4 v6, 0x0

    goto :goto_3e

    :cond_38
    iget-object v6, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v6, v1, v3}, Landroid/support/v7/widget/DropDownListView;->lookForSelectablePosition(IZ)I

    move-result v6

    :goto_3e
    if-eqz v5, :cond_46

    invoke-interface {v4}, Landroid/widget/ListAdapter;->getCount()I

    move-result v4

    sub-int/2addr v4, v3

    goto :goto_51

    :cond_46
    iget-object v5, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-interface {v4}, Landroid/widget/ListAdapter;->getCount()I

    move-result v4

    sub-int/2addr v4, v3

    invoke-virtual {v5, v4, v1}, Landroid/support/v7/widget/DropDownListView;->lookForSelectablePosition(IZ)I

    move-result v4

    :goto_51
    move v5, v6

    goto :goto_55

    :cond_53
    const/high16 v4, -0x80000000

    :goto_55
    const/16 v6, 0x13

    if-eqz v2, :cond_5d

    if-ne p1, v6, :cond_5d

    if-le v0, v5, :cond_65

    :cond_5d
    const/16 v7, 0x14

    if-nez v2, :cond_71

    if-ne p1, v7, :cond_71

    if-lt v0, v4, :cond_71

    :cond_65
    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->clearListSelection()V

    iget-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {p1, v3}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->show()V

    return v3

    :cond_71
    iget-object v8, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v8, v1}, Landroid/support/v7/widget/DropDownListView;->setListSelectionHidden(Z)V

    iget-object v8, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v8, p1, p2}, Landroid/support/v7/widget/DropDownListView;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result p2

    if-eqz p2, :cond_99

    iget-object p2, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    const/4 v0, 0x2

    invoke-virtual {p2, v0}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    iget-object p2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {p2}, Landroid/support/v7/widget/DropDownListView;->requestFocusFromTouch()Z

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->show()V

    const/16 p2, 0x17

    if-eq p1, p2, :cond_98

    const/16 p2, 0x42

    if-eq p1, p2, :cond_98

    packed-switch p1, :pswitch_data_a8

    goto :goto_a7

    :cond_98
    :pswitch_98
    return v3

    :cond_99
    if-eqz v2, :cond_a0

    if-ne p1, v7, :cond_a0

    if-ne v0, v4, :cond_a7

    return v3

    :cond_a0
    if-nez v2, :cond_a7

    if-ne p1, v6, :cond_a7

    if-ne v0, v5, :cond_a7

    return v3

    :cond_a7
    :goto_a7
    return v1

    :pswitch_data_a8
    .packed-switch 0x13
        :pswitch_98
        :pswitch_98
    .end packed-switch
.end method

.method public onKeyPreIme(ILandroid/view/KeyEvent;)Z
    .registers 5
    .param p2    # Landroid/view/KeyEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x4

    if-ne p1, v0, :cond_41

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result p1

    if-eqz p1, :cond_41

    iget-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownAnchorView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_22

    invoke-virtual {p2}, Landroid/view/KeyEvent;->getRepeatCount()I

    move-result v0

    if-nez v0, :cond_22

    invoke-virtual {p1}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object p1

    if-eqz p1, :cond_21

    invoke-virtual {p1, p2, p0}, Landroid/view/KeyEvent$DispatcherState;->startTracking(Landroid/view/KeyEvent;Ljava/lang/Object;)V

    :cond_21
    return v1

    :cond_22
    invoke-virtual {p2}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-ne v0, v1, :cond_41

    invoke-virtual {p1}, Landroid/view/View;->getKeyDispatcherState()Landroid/view/KeyEvent$DispatcherState;

    move-result-object p1

    if-eqz p1, :cond_31

    invoke-virtual {p1, p2}, Landroid/view/KeyEvent$DispatcherState;->handleUpEvent(Landroid/view/KeyEvent;)V

    :cond_31
    invoke-virtual {p2}, Landroid/view/KeyEvent;->isTracking()Z

    move-result p1

    if-eqz p1, :cond_41

    invoke-virtual {p2}, Landroid/view/KeyEvent;->isCanceled()Z

    move-result p1

    if-nez p1, :cond_41

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->dismiss()V

    return v1

    :cond_41
    const/4 p1, 0x0

    return p1
.end method

.method public onKeyUp(ILandroid/view/KeyEvent;)Z
    .registers 4
    .param p2    # Landroid/view/KeyEvent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_20

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->getSelectedItemPosition()I

    move-result v0

    if-ltz v0, :cond_20

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0, p1, p2}, Landroid/support/v7/widget/DropDownListView;->onKeyUp(ILandroid/view/KeyEvent;)Z

    move-result p2

    if-eqz p2, :cond_1f

    invoke-static {p1}, Landroid/support/v7/widget/ListPopupWindow;->isConfirmKey(I)Z

    move-result p1

    if-eqz p1, :cond_1f

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->dismiss()V

    :cond_1f
    return p2

    :cond_20
    const/4 p1, 0x0

    return p1
.end method

.method public performItemClick(I)Z
    .registers 9

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    if-eqz v0, :cond_24

    iget-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v2}, Landroid/support/v7/widget/DropDownListView;->getFirstVisiblePosition()I

    move-result v0

    sub-int v0, p1, v0

    invoke-virtual {v2, v0}, Landroid/support/v7/widget/DropDownListView;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2}, Landroid/support/v7/widget/DropDownListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    invoke-interface {v0, p1}, Landroid/widget/ListAdapter;->getItemId(I)J

    move-result-wide v5

    move v4, p1

    invoke-interface/range {v1 .. v6}, Landroid/widget/AdapterView$OnItemClickListener;->onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V

    :cond_24
    const/4 p1, 0x1

    return p1

    :cond_26
    const/4 p1, 0x0

    return p1
.end method

.method public postShow()V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mShowDropDownRunnable:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public setAdapter(Landroid/widget/ListAdapter;)V
    .registers 4
    .param p1    # Landroid/widget/ListAdapter;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mObserver:Landroid/database/DataSetObserver;

    if-nez v0, :cond_c

    new-instance v0, Landroid/support/v7/widget/ListPopupWindow$PopupDataSetObserver;

    invoke-direct {v0, p0}, Landroid/support/v7/widget/ListPopupWindow$PopupDataSetObserver;-><init>(Landroid/support/v7/widget/ListPopupWindow;)V

    iput-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mObserver:Landroid/database/DataSetObserver;

    goto :goto_17

    :cond_c
    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz v0, :cond_17

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mObserver:Landroid/database/DataSetObserver;

    invoke-interface {v0, v1}, Landroid/widget/ListAdapter;->unregisterDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_17
    :goto_17
    iput-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    if-eqz p1, :cond_20

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mObserver:Landroid/database/DataSetObserver;

    invoke-interface {p1, v0}, Landroid/widget/ListAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    :cond_20
    iget-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    if-eqz p1, :cond_2b

    iget-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mAdapter:Landroid/widget/ListAdapter;

    invoke-virtual {p1, v0}, Landroid/support/v7/widget/DropDownListView;->setAdapter(Landroid/widget/ListAdapter;)V

    :cond_2b
    return-void
.end method

.method public setAnchorView(Landroid/view/View;)V
    .registers 2
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownAnchorView:Landroid/view/View;

    return-void
.end method

.method public setAnimationStyle(I)V
    .registers 3
    .param p1    # I
        .annotation build Landroid/support/annotation/StyleRes;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setAnimationStyle(I)V

    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 3
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method

.method public setContentWidth(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0}, Landroid/widget/PopupWindow;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_1a

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mTempRect:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    add-int/2addr v0, v1

    add-int/2addr v0, p1

    iput v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    goto :goto_1d

    :cond_1a
    invoke-virtual {p0, p1}, Landroid/support/v7/widget/ListPopupWindow;->setWidth(I)V

    :goto_1d
    return-void
.end method

.method public setDropDownAlwaysVisible(Z)V
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iput-boolean p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    return-void
.end method

.method public setDropDownGravity(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownGravity:I

    return-void
.end method

.method public setEpicenterBounds(Landroid/graphics/Rect;)V
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iput-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mEpicenterBounds:Landroid/graphics/Rect;

    return-void
.end method

.method public setForceIgnoreOutsideTouch(Z)V
    .registers 2
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    iput-boolean p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mForceIgnoreOutsideTouch:Z

    return-void
.end method

.method public setHeight(I)V
    .registers 3

    if-gez p1, :cond_11

    const/4 v0, -0x2

    if-eq v0, p1, :cond_11

    const/4 v0, -0x1

    if-ne v0, p1, :cond_9

    goto :goto_11

    :cond_9
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid height. Must be a positive value, MATCH_PARENT, or WRAP_CONTENT."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_11
    :goto_11
    iput p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    return-void
.end method

.method public setHorizontalOffset(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    return-void
.end method

.method public setInputMethodMode(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setInputMethodMode(I)V

    return-void
.end method

.method setListItemExpandMax(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mListItemExpandMaximum:I

    return-void
.end method

.method public setListSelector(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    iput-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownListHighlight:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public setModal(Z)V
    .registers 3

    iput-boolean p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mModal:Z

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setFocusable(Z)V

    return-void
.end method

.method public setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V
    .registers 3
    .param p1    # Landroid/widget/PopupWindow$OnDismissListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setOnDismissListener(Landroid/widget/PopupWindow$OnDismissListener;)V

    return-void
.end method

.method public setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V
    .registers 2
    .param p1    # Landroid/widget/AdapterView$OnItemClickListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mItemClickListener:Landroid/widget/AdapterView$OnItemClickListener;

    return-void
.end method

.method public setOnItemSelectedListener(Landroid/widget/AdapterView$OnItemSelectedListener;)V
    .registers 2
    .param p1    # Landroid/widget/AdapterView$OnItemSelectedListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mItemSelectedListener:Landroid/widget/AdapterView$OnItemSelectedListener;

    return-void
.end method

.method public setOverlapAnchor(Z)V
    .registers 3
    .annotation build Landroid/support/annotation/RestrictTo;
        value = {
            .enum Landroid/support/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroid/support/annotation/RestrictTo$Scope;
        }
    .end annotation

    const/4 v0, 0x1

    iput-boolean v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mOverlapAnchorSet:Z

    iput-boolean p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mOverlapAnchor:Z

    return-void
.end method

.method public setPromptPosition(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptPosition:I

    return-void
.end method

.method public setPromptView(Landroid/view/View;)V
    .registers 3
    .param p1    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_9

    invoke-direct {p0}, Landroid/support/v7/widget/ListPopupWindow;->removePromptView()V

    :cond_9
    iput-object p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPromptView:Landroid/view/View;

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->show()V

    :cond_10
    return-void
.end method

.method public setSelection(I)V
    .registers 4

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_1b

    if-eqz v0, :cond_1b

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/DropDownListView;->setListSelectionHidden(Z)V

    invoke-virtual {v0, p1}, Landroid/support/v7/widget/DropDownListView;->setSelection(I)V

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->getChoiceMode()I

    move-result v1

    if-eqz v1, :cond_1b

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Landroid/support/v7/widget/DropDownListView;->setItemChecked(IZ)V

    :cond_1b
    return-void
.end method

.method public setSoftInputMode(I)V
    .registers 3

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v0, p1}, Landroid/widget/PopupWindow;->setSoftInputMode(I)V

    return-void
.end method

.method public setVerticalOffset(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    const/4 p1, 0x1

    iput-boolean p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffsetSet:Z

    return-void
.end method

.method public setWidth(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    return-void
.end method

.method public setWindowLayoutType(I)V
    .registers 2

    iput p1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWindowLayoutType:I

    return-void
.end method

.method public show()V
    .registers 14

    invoke-direct {p0}, Landroid/support/v7/widget/ListPopupWindow;->buildDropDown()I

    move-result v0

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->isInputMethodNotNeeded()Z

    move-result v1

    iget-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    iget v3, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWindowLayoutType:I

    invoke-static {v2, v3}, Landroid/support/v4/widget/PopupWindowCompat;->setWindowLayoutType(Landroid/widget/PopupWindow;I)V

    iget-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v2}, Landroid/widget/PopupWindow;->isShowing()Z

    move-result v2

    const/4 v3, 0x1

    const/4 v4, -0x2

    const/4 v5, 0x0

    const/4 v6, -0x1

    if-eqz v2, :cond_98

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Landroid/support/v4/view/ViewCompat;->isAttachedToWindow(Landroid/view/View;)Z

    move-result v2

    if-nez v2, :cond_26

    return-void

    :cond_26
    iget v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v2, v6, :cond_2c

    const/4 v2, -0x1

    goto :goto_3b

    :cond_2c
    iget v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v2, v4, :cond_39

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    move-result v2

    goto :goto_3b

    :cond_39
    iget v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    :goto_3b
    iget v7, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    if-ne v7, v6, :cond_69

    if-eqz v1, :cond_42

    goto :goto_43

    :cond_42
    const/4 v0, -0x1

    :goto_43
    if-eqz v1, :cond_57

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    iget v4, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v4, v6, :cond_4d

    const/4 v4, -0x1

    goto :goto_4e

    :cond_4d
    const/4 v4, 0x0

    :goto_4e
    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v5}, Landroid/widget/PopupWindow;->setHeight(I)V

    goto :goto_70

    :cond_57
    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    iget v4, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v4, v6, :cond_5f

    const/4 v4, -0x1

    goto :goto_60

    :cond_5f
    const/4 v4, 0x0

    :goto_60
    invoke-virtual {v1, v4}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v6}, Landroid/widget/PopupWindow;->setHeight(I)V

    goto :goto_70

    :cond_69
    iget v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    if-ne v1, v4, :cond_6e

    goto :goto_70

    :cond_6e
    iget v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    :goto_70
    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    iget-boolean v4, p0, Landroid/support/v7/widget/ListPopupWindow;->mForceIgnoreOutsideTouch:Z

    if-nez v4, :cond_7b

    iget-boolean v4, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    if-nez v4, :cond_7b

    goto :goto_7c

    :cond_7b
    const/4 v3, 0x0

    :goto_7c
    invoke-virtual {v1, v3}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iget-object v7, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v8

    iget v9, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    iget v10, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    if-gez v2, :cond_8d

    const/4 v11, -0x1

    goto :goto_8e

    :cond_8d
    move v11, v2

    :goto_8e
    if-gez v0, :cond_92

    const/4 v12, -0x1

    goto :goto_93

    :cond_92
    move v12, v0

    :goto_93
    invoke-virtual/range {v7 .. v12}, Landroid/widget/PopupWindow;->update(Landroid/view/View;IIII)V

    goto/16 :goto_131

    :cond_98
    iget v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v1, v6, :cond_9e

    const/4 v1, -0x1

    goto :goto_ad

    :cond_9e
    iget v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    if-ne v1, v4, :cond_ab

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    goto :goto_ad

    :cond_ab
    iget v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownWidth:I

    :goto_ad
    iget v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    if-ne v2, v6, :cond_b3

    const/4 v0, -0x1

    goto :goto_ba

    :cond_b3
    iget v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    if-ne v2, v4, :cond_b8

    goto :goto_ba

    :cond_b8
    iget v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHeight:I

    :goto_ba
    iget-object v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v2, v1}, Landroid/widget/PopupWindow;->setWidth(I)V

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {v1, v0}, Landroid/widget/PopupWindow;->setHeight(I)V

    invoke-direct {p0, v3}, Landroid/support/v7/widget/ListPopupWindow;->setPopupClipToScreenEnabled(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    iget-boolean v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mForceIgnoreOutsideTouch:Z

    if-nez v1, :cond_d3

    iget-boolean v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownAlwaysVisible:Z

    if-nez v1, :cond_d3

    const/4 v1, 0x1

    goto :goto_d4

    :cond_d3
    const/4 v1, 0x0

    :goto_d4
    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setOutsideTouchable(Z)V

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mTouchInterceptor:Landroid/support/v7/widget/ListPopupWindow$PopupTouchInterceptor;

    invoke-virtual {v0, v1}, Landroid/widget/PopupWindow;->setTouchInterceptor(Landroid/view/View$OnTouchListener;)V

    iget-boolean v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mOverlapAnchorSet:Z

    if-eqz v0, :cond_e9

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    iget-boolean v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mOverlapAnchor:Z

    invoke-static {v0, v1}, Landroid/support/v4/widget/PopupWindowCompat;->setOverlapAnchor(Landroid/widget/PopupWindow;Z)V

    :cond_e9
    sget-object v0, Landroid/support/v7/widget/ListPopupWindow;->sSetEpicenterBoundsMethod:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_103

    :try_start_ed
    sget-object v0, Landroid/support/v7/widget/ListPopupWindow;->sSetEpicenterBoundsMethod:Ljava/lang/reflect/Method;

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    new-array v2, v3, [Ljava/lang/Object;

    iget-object v3, p0, Landroid/support/v7/widget/ListPopupWindow;->mEpicenterBounds:Landroid/graphics/Rect;

    aput-object v3, v2, v5

    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_fa
    .catch Ljava/lang/Exception; {:try_start_ed .. :try_end_fa} :catch_fb

    goto :goto_103

    :catch_fb
    move-exception v0

    const-string v1, "ListPopupWindow"

    const-string v2, "Could not invoke setEpicenterBounds on PopupWindow"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :cond_103
    :goto_103
    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mPopup:Landroid/widget/PopupWindow;

    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->getAnchorView()Landroid/view/View;

    move-result-object v1

    iget v2, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownHorizontalOffset:I

    iget v3, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownVerticalOffset:I

    iget v4, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownGravity:I

    invoke-static {v0, v1, v2, v3, v4}, Landroid/support/v4/widget/PopupWindowCompat;->showAsDropDown(Landroid/widget/PopupWindow;Landroid/view/View;III)V

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0, v6}, Landroid/support/v7/widget/DropDownListView;->setSelection(I)V

    iget-boolean v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mModal:Z

    if-eqz v0, :cond_123

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mDropDownList:Landroid/support/v7/widget/DropDownListView;

    invoke-virtual {v0}, Landroid/support/v7/widget/DropDownListView;->isInTouchMode()Z

    move-result v0

    if-eqz v0, :cond_126

    :cond_123
    invoke-virtual {p0}, Landroid/support/v7/widget/ListPopupWindow;->clearListSelection()V

    :cond_126
    iget-boolean v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mModal:Z

    if-nez v0, :cond_131

    iget-object v0, p0, Landroid/support/v7/widget/ListPopupWindow;->mHandler:Landroid/os/Handler;

    iget-object v1, p0, Landroid/support/v7/widget/ListPopupWindow;->mHideSelector:Landroid/support/v7/widget/ListPopupWindow$ListSelectorHider;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_131
    :goto_131
    return-void
.end method
