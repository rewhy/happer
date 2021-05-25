.class Landroid/support/v4/app/FragmentTransition;
.super Ljava/lang/Object;
.source "FragmentTransition.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;
    }
.end annotation


# static fields
.field private static final INVERSE_OPS:[I

.field private static final PLATFORM_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

.field private static final SUPPORT_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    const/16 v0, 0xa

    new-array v0, v0, [I

    fill-array-data v0, :array_20

    sput-object v0, Landroid/support/v4/app/FragmentTransition;->INVERSE_OPS:[I

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_15

    new-instance v0, Landroid/support/v4/app/FragmentTransitionCompat21;

    invoke-direct {v0}, Landroid/support/v4/app/FragmentTransitionCompat21;-><init>()V

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    sput-object v0, Landroid/support/v4/app/FragmentTransition;->PLATFORM_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    invoke-static {}, Landroid/support/v4/app/FragmentTransition;->resolveSupportImpl()Landroid/support/v4/app/FragmentTransitionImpl;

    move-result-object v0

    sput-object v0, Landroid/support/v4/app/FragmentTransition;->SUPPORT_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    return-void

    nop

    :array_20
    .array-data 4
        0x0
        0x3
        0x0
        0x1
        0x5
        0x4
        0x7
        0x6
        0x9
        0x8
    .end array-data
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static addSharedElementsWithMatchingNames(Ljava/util/ArrayList;Landroid/support/v4/util/ArrayMap;Ljava/util/Collection;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_1e

    invoke-virtual {p1, v0}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2, v2}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1b

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1b
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_1e
    return-void
.end method

.method private static addToFirstInLastOut(Landroid/support/v4/app/BackStackRecord;Landroid/support/v4/app/BackStackRecord$Op;Landroid/util/SparseArray;ZZ)V
    .registers 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord;",
            "Landroid/support/v4/app/BackStackRecord$Op;",
            "Landroid/util/SparseArray<",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            ">;ZZ)V"
        }
    .end annotation

    move-object v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    iget-object v10, v1, Landroid/support/v4/app/BackStackRecord$Op;->fragment:Landroid/support/v4/app/Fragment;

    if-nez v10, :cond_c

    return-void

    :cond_c
    iget v11, v10, Landroid/support/v4/app/Fragment;->mContainerId:I

    if-nez v11, :cond_11

    return-void

    :cond_11
    if-eqz v3, :cond_1a

    sget-object v4, Landroid/support/v4/app/FragmentTransition;->INVERSE_OPS:[I

    iget v1, v1, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    aget v1, v4, v1

    goto :goto_1c

    :cond_1a
    iget v1, v1, Landroid/support/v4/app/BackStackRecord$Op;->cmd:I

    :goto_1c
    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eq v1, v5, :cond_7c

    packed-switch v1, :pswitch_data_ea

    const/4 v1, 0x0

    :goto_24
    const/4 v12, 0x0

    const/4 v13, 0x0

    goto/16 :goto_8f

    :pswitch_28
    if-eqz p4, :cond_37

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    if-eqz v1, :cond_8b

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v1, :cond_8b

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-eqz v1, :cond_8b

    goto :goto_89

    :cond_37
    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mHidden:Z

    goto :goto_8c

    :pswitch_3a
    if-eqz p4, :cond_49

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    if-eqz v1, :cond_6d

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-eqz v1, :cond_6d

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-eqz v1, :cond_6d

    :goto_48
    goto :goto_6b

    :cond_49
    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-eqz v1, :cond_6d

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v1, :cond_6d

    goto :goto_48

    :pswitch_52
    if-eqz p4, :cond_6f

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-nez v1, :cond_6d

    iget-object v1, v10, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    if-eqz v1, :cond_6d

    iget-object v1, v10, Landroid/support/v4/app/Fragment;->mView:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v1

    if-nez v1, :cond_6d

    iget v1, v10, Landroid/support/v4/app/Fragment;->mPostponedAlpha:F

    const/4 v6, 0x0

    cmpl-float v1, v1, v6

    if-ltz v1, :cond_6d

    :goto_6b
    const/4 v1, 0x1

    goto :goto_78

    :cond_6d
    const/4 v1, 0x0

    goto :goto_78

    :cond_6f
    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-eqz v1, :cond_6d

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v1, :cond_6d

    goto :goto_6b

    :goto_78
    move v13, v1

    const/4 v1, 0x0

    const/4 v12, 0x1

    goto :goto_8f

    :cond_7c
    :pswitch_7c
    if-eqz p4, :cond_81

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mIsNewlyAdded:Z

    goto :goto_8c

    :cond_81
    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-nez v1, :cond_8b

    iget-boolean v1, v10, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-nez v1, :cond_8b

    :goto_89
    const/4 v1, 0x1

    goto :goto_8c

    :cond_8b
    const/4 v1, 0x0

    :goto_8c
    move v4, v1

    const/4 v1, 0x1

    goto :goto_24

    :goto_8f
    invoke-virtual {v2, v11}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;

    if-eqz v4, :cond_a1

    invoke-static {v6, v2, v11}, Landroid/support/v4/app/FragmentTransition;->ensureContainer(Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Landroid/util/SparseArray;I)Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;

    move-result-object v6

    iput-object v10, v6, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastIn:Landroid/support/v4/app/Fragment;

    iput-boolean v3, v6, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInIsPop:Z

    iput-object v0, v6, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInTransaction:Landroid/support/v4/app/BackStackRecord;

    :cond_a1
    move-object v14, v6

    const/4 v9, 0x0

    if-nez p4, :cond_c9

    if-eqz v1, :cond_c9

    if-eqz v14, :cond_af

    iget-object v1, v14, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOut:Landroid/support/v4/app/Fragment;

    if-ne v1, v10, :cond_af

    iput-object v9, v14, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOut:Landroid/support/v4/app/Fragment;

    :cond_af
    iget-object v4, v0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget v1, v10, Landroid/support/v4/app/Fragment;->mState:I

    if-ge v1, v5, :cond_c9

    iget v1, v4, Landroid/support/v4/app/FragmentManagerImpl;->mCurState:I

    if-lt v1, v5, :cond_c9

    iget-boolean v1, v0, Landroid/support/v4/app/BackStackRecord;->mReorderingAllowed:Z

    if-nez v1, :cond_c9

    invoke-virtual {v4, v10}, Landroid/support/v4/app/FragmentManagerImpl;->makeActive(Landroid/support/v4/app/Fragment;)V

    const/4 v6, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v1, 0x0

    move-object v5, v10

    move v9, v1

    invoke-virtual/range {v4 .. v9}, Landroid/support/v4/app/FragmentManagerImpl;->moveToState(Landroid/support/v4/app/Fragment;IIIZ)V

    :cond_c9
    if-eqz v13, :cond_db

    if-eqz v14, :cond_d1

    iget-object v1, v14, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOut:Landroid/support/v4/app/Fragment;

    if-nez v1, :cond_db

    :cond_d1
    invoke-static {v14, v2, v11}, Landroid/support/v4/app/FragmentTransition;->ensureContainer(Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Landroid/util/SparseArray;I)Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;

    move-result-object v14

    iput-object v10, v14, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOut:Landroid/support/v4/app/Fragment;

    iput-boolean v3, v14, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutIsPop:Z

    iput-object v0, v14, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutTransaction:Landroid/support/v4/app/BackStackRecord;

    :cond_db
    if-nez p4, :cond_e8

    if-eqz v12, :cond_e8

    if-eqz v14, :cond_e8

    iget-object v0, v14, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastIn:Landroid/support/v4/app/Fragment;

    if-ne v0, v10, :cond_e8

    const/4 v0, 0x0

    iput-object v0, v14, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastIn:Landroid/support/v4/app/Fragment;

    :cond_e8
    return-void

    nop

    :pswitch_data_ea
    .packed-switch 0x3
        :pswitch_52
        :pswitch_3a
        :pswitch_28
        :pswitch_52
        :pswitch_7c
    .end packed-switch
.end method

.method public static calculateFragments(Landroid/support/v4/app/BackStackRecord;Landroid/util/SparseArray;Z)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord;",
            "Landroid/util/SparseArray<",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            ">;Z)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/BackStackRecord;->mOps:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_18

    iget-object v3, p0, Landroid/support/v4/app/BackStackRecord;->mOps:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/support/v4/app/BackStackRecord$Op;

    invoke-static {p0, v3, p1, v1, p2}, Landroid/support/v4/app/FragmentTransition;->addToFirstInLastOut(Landroid/support/v4/app/BackStackRecord;Landroid/support/v4/app/BackStackRecord$Op;Landroid/util/SparseArray;ZZ)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_18
    return-void
.end method

.method private static calculateNameOverrides(ILjava/util/ArrayList;Ljava/util/ArrayList;II)Landroid/support/v4/util/ArrayMap;
    .registers 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/app/BackStackRecord;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;II)",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    add-int/lit8 p4, p4, -0x1

    :goto_7
    if-lt p4, p3, :cond_5c

    invoke-virtual {p1, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/BackStackRecord;

    invoke-virtual {v1, p0}, Landroid/support/v4/app/BackStackRecord;->interactsWith(I)Z

    move-result v2

    if-nez v2, :cond_16

    goto :goto_59

    :cond_16
    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    iget-object v3, v1, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    if-eqz v3, :cond_59

    iget-object v3, v1, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-eqz v2, :cond_31

    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    iget-object v1, v1, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    goto :goto_38

    :cond_31
    iget-object v2, v1, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    iget-object v1, v1, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    move-object v8, v2

    move-object v2, v1

    move-object v1, v8

    :goto_38
    const/4 v4, 0x0

    :goto_39
    if-ge v4, v3, :cond_59

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v0, v6}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    if-eqz v7, :cond_53

    invoke-virtual {v0, v5, v7}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_56

    :cond_53
    invoke-virtual {v0, v5, v6}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_56
    add-int/lit8 v4, v4, 0x1

    goto :goto_39

    :cond_59
    :goto_59
    add-int/lit8 p4, p4, -0x1

    goto :goto_7

    :cond_5c
    return-object v0
.end method

.method public static calculatePopFragments(Landroid/support/v4/app/BackStackRecord;Landroid/util/SparseArray;Z)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/BackStackRecord;",
            "Landroid/util/SparseArray<",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            ">;Z)V"
        }
    .end annotation

    iget-object v0, p0, Landroid/support/v4/app/BackStackRecord;->mManager:Landroid/support/v4/app/FragmentManagerImpl;

    iget-object v0, v0, Landroid/support/v4/app/FragmentManagerImpl;->mContainer:Landroid/support/v4/app/FragmentContainer;

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentContainer;->onHasView()Z

    move-result v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object v0, p0, Landroid/support/v4/app/BackStackRecord;->mOps:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    :goto_13
    if-ltz v0, :cond_23

    iget-object v2, p0, Landroid/support/v4/app/BackStackRecord;->mOps:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/BackStackRecord$Op;

    invoke-static {p0, v2, p1, v1, p2}, Landroid/support/v4/app/FragmentTransition;->addToFirstInLastOut(Landroid/support/v4/app/BackStackRecord;Landroid/support/v4/app/BackStackRecord$Op;Landroid/util/SparseArray;ZZ)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_13

    :cond_23
    return-void
.end method

.method static callSharedElementStartEnd(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/util/ArrayMap;Z)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/Fragment;",
            "Landroid/support/v4/app/Fragment;",
            "Z",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;Z)V"
        }
    .end annotation

    if-eqz p2, :cond_7

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getEnterTransitionCallback()Landroid/support/v4/app/SharedElementCallback;

    move-result-object p0

    goto :goto_b

    :cond_7
    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getEnterTransitionCallback()Landroid/support/v4/app/SharedElementCallback;

    move-result-object p0

    :goto_b
    if-eqz p0, :cond_3d

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    const/4 v0, 0x0

    if-nez p3, :cond_1c

    const/4 v1, 0x0

    goto :goto_20

    :cond_1c
    invoke-virtual {p3}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v1

    :goto_20
    if-ge v0, v1, :cond_33

    invoke-virtual {p3, v0}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p3, v0}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v0, v0, 0x1

    goto :goto_20

    :cond_33
    const/4 p3, 0x0

    if-eqz p4, :cond_3a

    invoke-virtual {p0, p2, p1, p3}, Landroid/support/v4/app/SharedElementCallback;->onSharedElementStart(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    goto :goto_3d

    :cond_3a
    invoke-virtual {p0, p2, p1, p3}, Landroid/support/v4/app/SharedElementCallback;->onSharedElementEnd(Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    :cond_3d
    :goto_3d
    return-void
.end method

.method private static canHandleAll(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/util/List;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransitionImpl;",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v0, :cond_16

    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/support/v4/app/FragmentTransitionImpl;->canHandle(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_13

    return v1

    :cond_13
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_16
    const/4 p0, 0x1

    return p0
.end method

.method static captureInSharedElements(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/util/ArrayMap;Ljava/lang/Object;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;)Landroid/support/v4/util/ArrayMap;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransitionImpl;",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            ")",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    iget-object v0, p3, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastIn:Landroid/support/v4/app/Fragment;

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p1}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_7b

    if-eqz p2, :cond_7b

    if-nez v1, :cond_11

    goto :goto_7b

    :cond_11
    new-instance p2, Landroid/support/v4/util/ArrayMap;

    invoke-direct {p2}, Landroid/support/v4/util/ArrayMap;-><init>()V

    invoke-virtual {p0, p2, v1}, Landroid/support/v4/app/FragmentTransitionImpl;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    iget-object p0, p3, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInTransaction:Landroid/support/v4/app/BackStackRecord;

    iget-boolean p3, p3, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInIsPop:Z

    if-eqz p3, :cond_26

    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getExitTransitionCallback()Landroid/support/v4/app/SharedElementCallback;

    move-result-object p3

    iget-object p0, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    goto :goto_2c

    :cond_26
    invoke-virtual {v0}, Landroid/support/v4/app/Fragment;->getEnterTransitionCallback()Landroid/support/v4/app/SharedElementCallback;

    move-result-object p3

    iget-object p0, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    :goto_2c
    if-eqz p0, :cond_38

    invoke-virtual {p2, p0}, Landroid/support/v4/util/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    invoke-virtual {p1}, Landroid/support/v4/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroid/support/v4/util/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    :cond_38
    if-eqz p3, :cond_77

    invoke-virtual {p3, p0, p2}, Landroid/support/v4/app/SharedElementCallback;->onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    :goto_43
    if-ltz p3, :cond_7a

    invoke-virtual {p0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p2, v0}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-nez v1, :cond_5d

    invoke-static {p1, v0}, Landroid/support/v4/app/FragmentTransition;->findKeyForValue(Landroid/support/v4/util/ArrayMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_74

    invoke-virtual {p1, v0}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_74

    :cond_5d
    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_74

    invoke-static {p1, v0}, Landroid/support/v4/app/FragmentTransition;->findKeyForValue(Landroid/support/v4/util/ArrayMap;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_74

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_74
    :goto_74
    add-int/lit8 p3, p3, -0x1

    goto :goto_43

    :cond_77
    invoke-static {p1, p2}, Landroid/support/v4/app/FragmentTransition;->retainValues(Landroid/support/v4/util/ArrayMap;Landroid/support/v4/util/ArrayMap;)V

    :cond_7a
    return-object p2

    :cond_7b
    :goto_7b
    invoke-virtual {p1}, Landroid/support/v4/util/ArrayMap;->clear()V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static captureOutSharedElements(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/util/ArrayMap;Ljava/lang/Object;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;)Landroid/support/v4/util/ArrayMap;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransitionImpl;",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/Object;",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            ")",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6e

    if-nez p2, :cond_9

    goto :goto_6e

    :cond_9
    iget-object p2, p3, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOut:Landroid/support/v4/app/Fragment;

    new-instance v0, Landroid/support/v4/util/ArrayMap;

    invoke-direct {v0}, Landroid/support/v4/util/ArrayMap;-><init>()V

    invoke-virtual {p2}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Landroid/support/v4/app/FragmentTransitionImpl;->findNamedViews(Ljava/util/Map;Landroid/view/View;)V

    iget-object p0, p3, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutTransaction:Landroid/support/v4/app/BackStackRecord;

    iget-boolean p3, p3, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutIsPop:Z

    if-eqz p3, :cond_24

    invoke-virtual {p2}, Landroid/support/v4/app/Fragment;->getEnterTransitionCallback()Landroid/support/v4/app/SharedElementCallback;

    move-result-object p2

    iget-object p0, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    goto :goto_2a

    :cond_24
    invoke-virtual {p2}, Landroid/support/v4/app/Fragment;->getExitTransitionCallback()Landroid/support/v4/app/SharedElementCallback;

    move-result-object p2

    iget-object p0, p0, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    :goto_2a
    invoke-virtual {v0, p0}, Landroid/support/v4/util/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    if-eqz p2, :cond_66

    invoke-virtual {p2, p0, v0}, Landroid/support/v4/app/SharedElementCallback;->onMapSharedElements(Ljava/util/List;Ljava/util/Map;)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    :goto_38
    if-ltz p2, :cond_6d

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-virtual {v0, p3}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-nez v1, :cond_4c

    invoke-virtual {p1, p3}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_63

    :cond_4c
    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_63

    invoke-virtual {p1, p3}, Landroid/support/v4/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-static {v1}, Landroid/support/v4/view/ViewCompat;->getTransitionName(Landroid/view/View;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1, p3}, Landroid/support/v4/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_63
    :goto_63
    add-int/lit8 p2, p2, -0x1

    goto :goto_38

    :cond_66
    invoke-virtual {v0}, Landroid/support/v4/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/support/v4/util/ArrayMap;->retainAll(Ljava/util/Collection;)Z

    :cond_6d
    return-object v0

    :cond_6e
    :goto_6e
    invoke-virtual {p1}, Landroid/support/v4/util/ArrayMap;->clear()V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static chooseImpl(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransitionImpl;
    .registers 4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_22

    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getExitTransition()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_10

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_10
    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getReturnTransition()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_19
    invoke-virtual {p0}, Landroid/support/v4/app/Fragment;->getSharedElementReturnTransition()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_22

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_22
    if-eqz p1, :cond_3f

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getEnterTransition()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_2d

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2d
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getReenterTransition()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_36

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_36
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getSharedElementEnterTransition()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_3f

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_3f
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    const/4 p1, 0x0

    if-eqz p0, :cond_47

    return-object p1

    :cond_47
    sget-object p0, Landroid/support/v4/app/FragmentTransition;->PLATFORM_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    if-eqz p0, :cond_56

    sget-object p0, Landroid/support/v4/app/FragmentTransition;->PLATFORM_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    invoke-static {p0, v0}, Landroid/support/v4/app/FragmentTransition;->canHandleAll(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/util/List;)Z

    move-result p0

    if-eqz p0, :cond_56

    sget-object p0, Landroid/support/v4/app/FragmentTransition;->PLATFORM_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    return-object p0

    :cond_56
    sget-object p0, Landroid/support/v4/app/FragmentTransition;->SUPPORT_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    if-eqz p0, :cond_65

    sget-object p0, Landroid/support/v4/app/FragmentTransition;->SUPPORT_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    invoke-static {p0, v0}, Landroid/support/v4/app/FragmentTransition;->canHandleAll(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/util/List;)Z

    move-result p0

    if-eqz p0, :cond_65

    sget-object p0, Landroid/support/v4/app/FragmentTransition;->SUPPORT_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    return-object p0

    :cond_65
    sget-object p0, Landroid/support/v4/app/FragmentTransition;->PLATFORM_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    if-nez p0, :cond_6e

    sget-object p0, Landroid/support/v4/app/FragmentTransition;->SUPPORT_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    if-nez p0, :cond_6e

    return-object p1

    :cond_6e
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Invalid Transition types"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static configureEnteringExitingViews(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransitionImpl;",
            "Ljava/lang/Object;",
            "Landroid/support/v4/app/Fragment;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_22

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p2}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object p2

    if-eqz p2, :cond_10

    invoke-virtual {p0, v0, p2}, Landroid/support/v4/app/FragmentTransitionImpl;->captureTransitioningViews(Ljava/util/ArrayList;Landroid/view/View;)V

    :cond_10
    if-eqz p3, :cond_15

    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    :cond_15
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_23

    invoke-virtual {v0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1, v0}, Landroid/support/v4/app/FragmentTransitionImpl;->addTargets(Ljava/lang/Object;Ljava/util/ArrayList;)V

    goto :goto_23

    :cond_22
    const/4 v0, 0x0

    :cond_23
    :goto_23
    return-object v0
.end method

.method private static configureSharedElementsOrdered(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/view/ViewGroup;Landroid/view/View;Landroid/support/v4/util/ArrayMap;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransitionImpl;",
            "Landroid/view/ViewGroup;",
            "Landroid/view/View;",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v6, p0

    move-object/from16 v7, p4

    move-object/from16 v10, p5

    move-object/from16 v11, p7

    iget-object v8, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastIn:Landroid/support/v4/app/Fragment;

    iget-object v9, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOut:Landroid/support/v4/app/Fragment;

    const/4 v0, 0x0

    if-eqz v8, :cond_87

    if-nez v9, :cond_13

    goto/16 :goto_87

    :cond_13
    iget-boolean v12, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInIsPop:Z

    invoke-virtual/range {p3 .. p3}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1f

    move-object/from16 v13, p3

    move-object v1, v0

    goto :goto_25

    :cond_1f
    invoke-static {v6, v8, v9, v12}, Landroid/support/v4/app/FragmentTransition;->getSharedElementTransition(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v1

    move-object/from16 v13, p3

    :goto_25
    invoke-static {v6, v13, v1, v7}, Landroid/support/v4/app/FragmentTransition;->captureOutSharedElements(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/util/ArrayMap;Ljava/lang/Object;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;)Landroid/support/v4/util/ArrayMap;

    move-result-object v3

    invoke-virtual/range {p3 .. p3}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_31

    move-object v14, v0

    goto :goto_39

    :cond_31
    invoke-virtual {v3}, Landroid/support/v4/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    move-object v14, v1

    :goto_39
    if-nez v11, :cond_40

    if-nez p8, :cond_40

    if-nez v14, :cond_40

    return-object v0

    :cond_40
    const/4 v1, 0x1

    invoke-static {v8, v9, v12, v3, v1}, Landroid/support/v4/app/FragmentTransition;->callSharedElementStartEnd(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/util/ArrayMap;Z)V

    if-eqz v14, :cond_66

    new-instance v15, Landroid/graphics/Rect;

    invoke-direct {v15}, Landroid/graphics/Rect;-><init>()V

    move-object/from16 v5, p2

    invoke-virtual {v6, v14, v5, v10}, Landroid/support/v4/app/FragmentTransitionImpl;->setSharedElementTargets(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    iget-boolean v4, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutIsPop:Z

    iget-object v1, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutTransaction:Landroid/support/v4/app/BackStackRecord;

    move-object/from16 v0, p0

    move-object/from16 v16, v1

    move-object v1, v14

    move-object/from16 v2, p8

    move-object/from16 v5, v16

    invoke-static/range {v0 .. v5}, Landroid/support/v4/app/FragmentTransition;->setOutEpicenter(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Ljava/lang/Object;Landroid/support/v4/util/ArrayMap;ZLandroid/support/v4/app/BackStackRecord;)V

    if-eqz v11, :cond_67

    invoke-virtual {v6, v11, v15}, Landroid/support/v4/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/graphics/Rect;)V

    goto :goto_67

    :cond_66
    move-object v15, v0

    :cond_67
    :goto_67
    new-instance v5, Landroid/support/v4/app/FragmentTransition$4;

    move-object v0, v5

    move-object/from16 v1, p0

    move-object/from16 v2, p3

    move-object v3, v14

    move-object/from16 v4, p4

    move-object v13, v5

    move-object/from16 v5, p6

    move-object/from16 v6, p2

    move-object v7, v8

    move-object v8, v9

    move v9, v12

    move-object/from16 v10, p5

    move-object/from16 v11, p7

    move-object v12, v15

    invoke-direct/range {v0 .. v12}, Landroid/support/v4/app/FragmentTransition$4;-><init>(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/util/ArrayMap;Ljava/lang/Object;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Ljava/util/ArrayList;Landroid/view/View;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLjava/util/ArrayList;Ljava/lang/Object;Landroid/graphics/Rect;)V

    move-object/from16 v0, p1

    invoke-static {v0, v13}, Landroid/support/v4/app/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroid/support/v4/app/OneShotPreDrawListener;

    return-object v14

    :cond_87
    :goto_87
    return-object v0
.end method

.method private static configureSharedElementsReordered(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/view/ViewGroup;Landroid/view/View;Landroid/support/v4/util/ArrayMap;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 25
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransitionImpl;",
            "Landroid/view/ViewGroup;",
            "Landroid/view/View;",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    move-object/from16 v6, p0

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move-object/from16 v7, p4

    move-object/from16 v2, p5

    move-object/from16 v3, p6

    move-object/from16 v8, p7

    iget-object v9, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastIn:Landroid/support/v4/app/Fragment;

    iget-object v10, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOut:Landroid/support/v4/app/Fragment;

    if-eqz v9, :cond_1c

    invoke-virtual {v9}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v4

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_1c
    const/4 v4, 0x0

    if-eqz v9, :cond_a0

    if-nez v10, :cond_23

    goto/16 :goto_a0

    :cond_23
    iget-boolean v11, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInIsPop:Z

    invoke-virtual/range {p3 .. p3}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v5

    if-eqz v5, :cond_2d

    move-object v5, v4

    goto :goto_31

    :cond_2d
    invoke-static {v6, v9, v10, v11}, Landroid/support/v4/app/FragmentTransition;->getSharedElementTransition(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v5

    :goto_31
    invoke-static {v6, v1, v5, v7}, Landroid/support/v4/app/FragmentTransition;->captureOutSharedElements(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/util/ArrayMap;Ljava/lang/Object;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;)Landroid/support/v4/util/ArrayMap;

    move-result-object v12

    invoke-static {v6, v1, v5, v7}, Landroid/support/v4/app/FragmentTransition;->captureInSharedElements(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/util/ArrayMap;Ljava/lang/Object;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;)Landroid/support/v4/util/ArrayMap;

    move-result-object v13

    invoke-virtual/range {p3 .. p3}, Landroid/support/v4/util/ArrayMap;->isEmpty()Z

    move-result v14

    if-eqz v14, :cond_4b

    if-eqz v12, :cond_44

    invoke-virtual {v12}, Landroid/support/v4/util/ArrayMap;->clear()V

    :cond_44
    if-eqz v13, :cond_49

    invoke-virtual {v13}, Landroid/support/v4/util/ArrayMap;->clear()V

    :cond_49
    move-object v14, v4

    goto :goto_5a

    :cond_4b
    invoke-virtual/range {p3 .. p3}, Landroid/support/v4/util/ArrayMap;->keySet()Ljava/util/Set;

    move-result-object v14

    invoke-static {v2, v12, v14}, Landroid/support/v4/app/FragmentTransition;->addSharedElementsWithMatchingNames(Ljava/util/ArrayList;Landroid/support/v4/util/ArrayMap;Ljava/util/Collection;)V

    invoke-virtual/range {p3 .. p3}, Landroid/support/v4/util/ArrayMap;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-static {v3, v13, v1}, Landroid/support/v4/app/FragmentTransition;->addSharedElementsWithMatchingNames(Ljava/util/ArrayList;Landroid/support/v4/util/ArrayMap;Ljava/util/Collection;)V

    move-object v14, v5

    :goto_5a
    if-nez v8, :cond_61

    if-nez p8, :cond_61

    if-nez v14, :cond_61

    return-object v4

    :cond_61
    const/4 v1, 0x1

    invoke-static {v9, v10, v11, v12, v1}, Landroid/support/v4/app/FragmentTransition;->callSharedElementStartEnd(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/util/ArrayMap;Z)V

    if-eqz v14, :cond_8c

    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v6, v14, v0, v2}, Landroid/support/v4/app/FragmentTransitionImpl;->setSharedElementTargets(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    iget-boolean v4, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutIsPop:Z

    iget-object v15, v7, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutTransaction:Landroid/support/v4/app/BackStackRecord;

    move-object/from16 v0, p0

    move-object v1, v14

    move-object/from16 v2, p8

    move-object v3, v12

    move-object v5, v15

    invoke-static/range {v0 .. v5}, Landroid/support/v4/app/FragmentTransition;->setOutEpicenter(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Ljava/lang/Object;Landroid/support/v4/util/ArrayMap;ZLandroid/support/v4/app/BackStackRecord;)V

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-static {v13, v7, v8, v11}, Landroid/support/v4/app/FragmentTransition;->getInEpicenterView(Landroid/support/v4/util/ArrayMap;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Ljava/lang/Object;Z)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_89

    invoke-virtual {v6, v8, v0}, Landroid/support/v4/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/graphics/Rect;)V

    :cond_89
    move-object v7, v0

    move-object v5, v1

    goto :goto_8e

    :cond_8c
    move-object v5, v4

    move-object v7, v5

    :goto_8e
    new-instance v8, Landroid/support/v4/app/FragmentTransition$3;

    move-object v0, v8

    move-object v1, v9

    move-object v2, v10

    move v3, v11

    move-object v4, v13

    move-object/from16 v6, p0

    invoke-direct/range {v0 .. v7}, Landroid/support/v4/app/FragmentTransition$3;-><init>(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;ZLandroid/support/v4/util/ArrayMap;Landroid/view/View;Landroid/support/v4/app/FragmentTransitionImpl;Landroid/graphics/Rect;)V

    move-object/from16 v0, p1

    invoke-static {v0, v8}, Landroid/support/v4/app/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroid/support/v4/app/OneShotPreDrawListener;

    return-object v14

    :cond_a0
    :goto_a0
    return-object v4
.end method

.method private static configureTransitionsOrdered(Landroid/support/v4/app/FragmentManagerImpl;ILandroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Landroid/view/View;Landroid/support/v4/util/ArrayMap;)V
    .registers 26
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentManagerImpl;",
            "I",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            "Landroid/view/View;",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    iget-object v1, v0, Landroid/support/v4/app/FragmentManagerImpl;->mContainer:Landroid/support/v4/app/FragmentContainer;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentContainer;->onHasView()Z

    move-result v1

    if-eqz v1, :cond_1c

    iget-object v0, v0, Landroid/support/v4/app/FragmentManagerImpl;->mContainer:Landroid/support/v4/app/FragmentContainer;

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentContainer;->onFindViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    move-object v13, v0

    goto :goto_1d

    :cond_1c
    const/4 v13, 0x0

    :goto_1d
    if-nez v13, :cond_20

    return-void

    :cond_20
    iget-object v14, v9, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastIn:Landroid/support/v4/app/Fragment;

    iget-object v15, v9, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOut:Landroid/support/v4/app/Fragment;

    invoke-static {v15, v14}, Landroid/support/v4/app/FragmentTransition;->chooseImpl(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransitionImpl;

    move-result-object v8

    if-nez v8, :cond_2b

    return-void

    :cond_2b
    iget-boolean v0, v9, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInIsPop:Z

    iget-boolean v1, v9, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutIsPop:Z

    invoke-static {v8, v14, v0}, Landroid/support/v4/app/FragmentTransition;->getEnterTransition(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v8, v15, v1}, Landroid/support/v4/app/FragmentTransition;->getExitTransition(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v6

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v8

    move-object v1, v13

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v16, v4

    move-object/from16 v4, p2

    move-object/from16 v17, v5

    move-object/from16 v18, v6

    move-object/from16 v6, v16

    move-object/from16 v19, v7

    move-object v12, v8

    move-object/from16 v8, v18

    invoke-static/range {v0 .. v8}, Landroid/support/v4/app/FragmentTransition;->configureSharedElementsOrdered(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/view/ViewGroup;Landroid/view/View;Landroid/support/v4/util/ArrayMap;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v8, v19

    if-nez v8, :cond_65

    if-nez v6, :cond_65

    move-object/from16 v0, v18

    if-nez v0, :cond_67

    return-void

    :cond_65
    move-object/from16 v0, v18

    :cond_67
    move-object/from16 v1, v17

    invoke-static {v12, v0, v15, v1, v10}, Landroid/support/v4/app/FragmentTransition;->configureEnteringExitingViews(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v15

    if-eqz v15, :cond_79

    invoke-virtual {v15}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_76

    goto :goto_79

    :cond_76
    move-object/from16 v20, v0

    goto :goto_7b

    :cond_79
    :goto_79
    const/16 v20, 0x0

    :goto_7b
    invoke-virtual {v12, v8, v10}, Landroid/support/v4/app/FragmentTransitionImpl;->addTarget(Ljava/lang/Object;Landroid/view/View;)V

    iget-boolean v5, v9, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInIsPop:Z

    move-object v0, v12

    move-object v1, v8

    move-object/from16 v2, v20

    move-object v3, v6

    move-object v4, v14

    invoke-static/range {v0 .. v5}, Landroid/support/v4/app/FragmentTransition;->mergeTransitions(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v9

    if-eqz v9, :cond_b8

    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    move-object v0, v12

    move-object v1, v9

    move-object v2, v8

    move-object/from16 v3, v17

    move-object/from16 v4, v20

    move-object v5, v15

    move-object/from16 v7, v16

    invoke-virtual/range {v0 .. v7}, Landroid/support/v4/app/FragmentTransitionImpl;->scheduleRemoveTargets(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    move-object v1, v13

    move-object v2, v14

    move-object/from16 v3, p3

    move-object/from16 v4, v16

    move-object v5, v8

    move-object/from16 v6, v17

    move-object/from16 v7, v20

    move-object v8, v15

    invoke-static/range {v0 .. v8}, Landroid/support/v4/app/FragmentTransition;->scheduleTargetChange(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/view/ViewGroup;Landroid/support/v4/app/Fragment;Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    move-object/from16 v0, v16

    invoke-virtual {v12, v13, v0, v11}, Landroid/support/v4/app/FragmentTransitionImpl;->setNameOverridesOrdered(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/Map;)V

    invoke-virtual {v12, v13, v9}, Landroid/support/v4/app/FragmentTransitionImpl;->beginDelayedTransition(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    invoke-virtual {v12, v13, v0, v11}, Landroid/support/v4/app/FragmentTransitionImpl;->scheduleNameReset(Landroid/view/ViewGroup;Ljava/util/ArrayList;Ljava/util/Map;)V

    :cond_b8
    return-void
.end method

.method private static configureTransitionsReordered(Landroid/support/v4/app/FragmentManagerImpl;ILandroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Landroid/view/View;Landroid/support/v4/util/ArrayMap;)V
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentManagerImpl;",
            "I",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            "Landroid/view/View;",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v4, p2

    move-object/from16 v9, p3

    iget-object v1, v0, Landroid/support/v4/app/FragmentManagerImpl;->mContainer:Landroid/support/v4/app/FragmentContainer;

    invoke-virtual {v1}, Landroid/support/v4/app/FragmentContainer;->onHasView()Z

    move-result v1

    if-eqz v1, :cond_19

    iget-object v0, v0, Landroid/support/v4/app/FragmentManagerImpl;->mContainer:Landroid/support/v4/app/FragmentContainer;

    move/from16 v1, p1

    invoke-virtual {v0, v1}, Landroid/support/v4/app/FragmentContainer;->onFindViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    move-object v10, v0

    if-nez v10, :cond_1e

    return-void

    :cond_1e
    iget-object v11, v4, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastIn:Landroid/support/v4/app/Fragment;

    iget-object v12, v4, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOut:Landroid/support/v4/app/Fragment;

    invoke-static {v12, v11}, Landroid/support/v4/app/FragmentTransition;->chooseImpl(Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/FragmentTransitionImpl;

    move-result-object v13

    if-nez v13, :cond_29

    return-void

    :cond_29
    iget-boolean v14, v4, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInIsPop:Z

    iget-boolean v0, v4, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->firstOutIsPop:Z

    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v13, v11, v14}, Landroid/support/v4/app/FragmentTransition;->getEnterTransition(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v13, v12, v0}, Landroid/support/v4/app/FragmentTransition;->getExitTransition(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v6

    move-object v0, v13

    move-object v1, v10

    move-object/from16 v2, p3

    move-object/from16 v3, p4

    move-object/from16 v4, p2

    move-object v5, v8

    move-object/from16 v16, v6

    move-object v6, v15

    move-object/from16 v17, v7

    move-object/from16 v18, v10

    move-object v10, v8

    move-object/from16 v8, v16

    invoke-static/range {v0 .. v8}, Landroid/support/v4/app/FragmentTransition;->configureSharedElementsReordered(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/view/ViewGroup;Landroid/view/View;Landroid/support/v4/util/ArrayMap;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object/from16 v6, v17

    if-nez v6, :cond_61

    if-nez v8, :cond_61

    move-object/from16 v7, v16

    if-nez v7, :cond_63

    return-void

    :cond_61
    move-object/from16 v7, v16

    :cond_63
    invoke-static {v13, v7, v12, v10, v9}, Landroid/support/v4/app/FragmentTransition;->configureEnteringExitingViews(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-static {v13, v6, v11, v15, v9}, Landroid/support/v4/app/FragmentTransition;->configureEnteringExitingViews(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;Landroid/view/View;)Ljava/util/ArrayList;

    move-result-object v9

    const/4 v0, 0x4

    invoke-static {v9, v0}, Landroid/support/v4/app/FragmentTransition;->setViewVisibility(Ljava/util/ArrayList;I)V

    move-object v0, v13

    move-object v1, v6

    move-object v2, v7

    move-object v3, v8

    move-object v4, v11

    move-object v11, v5

    move v5, v14

    invoke-static/range {v0 .. v5}, Landroid/support/v4/app/FragmentTransition;->mergeTransitions(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;

    move-result-object v14

    if-eqz v14, :cond_a4

    invoke-static {v13, v7, v12, v11}, Landroid/support/v4/app/FragmentTransition;->replaceHide(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;)V

    invoke-virtual {v13, v15}, Landroid/support/v4/app/FragmentTransitionImpl;->prepareSetNameOverridesReordered(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v12

    move-object v0, v13

    move-object v1, v14

    move-object v2, v6

    move-object v3, v9

    move-object v4, v7

    move-object v5, v11

    move-object v6, v8

    move-object v7, v15

    invoke-virtual/range {v0 .. v7}, Landroid/support/v4/app/FragmentTransitionImpl;->scheduleRemoveTargets(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    move-object/from16 v0, v18

    invoke-virtual {v13, v0, v14}, Landroid/support/v4/app/FragmentTransitionImpl;->beginDelayedTransition(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    move-object v1, v13

    move-object v2, v0

    move-object v3, v10

    move-object v4, v15

    move-object v5, v12

    move-object/from16 v6, p4

    invoke-virtual/range {v1 .. v6}, Landroid/support/v4/app/FragmentTransitionImpl;->setNameOverridesReordered(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/Map;)V

    const/4 v0, 0x0

    invoke-static {v9, v0}, Landroid/support/v4/app/FragmentTransition;->setViewVisibility(Ljava/util/ArrayList;I)V

    invoke-virtual {v13, v8, v10, v15}, Landroid/support/v4/app/FragmentTransitionImpl;->swapSharedElementTargets(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    :cond_a4
    return-void
.end method

.method private static ensureContainer(Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Landroid/util/SparseArray;I)Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            "Landroid/util/SparseArray<",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            ">;I)",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;"
        }
    .end annotation

    if-nez p0, :cond_a

    new-instance p0, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;

    invoke-direct {p0}, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;-><init>()V

    invoke-virtual {p1, p2, p0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    :cond_a
    return-object p0
.end method

.method private static findKeyForValue(Landroid/support/v4/util/ArrayMap;Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_5
    if-ge v1, v0, :cond_1b

    invoke-virtual {p0, v1}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_18

    invoke-virtual {p0, v1}, Landroid/support/v4/util/ArrayMap;->keyAt(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_18
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    :cond_1b
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getEnterTransition(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;
    .registers 3

    if-nez p1, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    if-eqz p2, :cond_b

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getReenterTransition()Ljava/lang/Object;

    move-result-object p1

    goto :goto_f

    :cond_b
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getEnterTransition()Ljava/lang/Object;

    move-result-object p1

    :goto_f
    invoke-virtual {p0, p1}, Landroid/support/v4/app/FragmentTransitionImpl;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private static getExitTransition(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;
    .registers 3

    if-nez p1, :cond_4

    const/4 p0, 0x0

    return-object p0

    :cond_4
    if-eqz p2, :cond_b

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getReturnTransition()Ljava/lang/Object;

    move-result-object p1

    goto :goto_f

    :cond_b
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getExitTransition()Ljava/lang/Object;

    move-result-object p1

    :goto_f
    invoke-virtual {p0, p1}, Landroid/support/v4/app/FragmentTransitionImpl;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static getInEpicenterView(Landroid/support/v4/util/ArrayMap;Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Ljava/lang/Object;Z)Landroid/view/View;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;",
            "Ljava/lang/Object;",
            "Z)",
            "Landroid/view/View;"
        }
    .end annotation

    iget-object p1, p1, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;->lastInTransaction:Landroid/support/v4/app/BackStackRecord;

    if-eqz p2, :cond_2d

    if-eqz p0, :cond_2d

    iget-object p2, p1, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    if-eqz p2, :cond_2d

    iget-object p2, p1, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_2d

    const/4 p2, 0x0

    if-eqz p3, :cond_1e

    iget-object p1, p1, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    goto :goto_26

    :cond_1e
    iget-object p1, p1, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    :goto_26
    invoke-virtual {p0, p1}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    return-object p0

    :cond_2d
    const/4 p0, 0x0

    return-object p0
.end method

.method private static getSharedElementTransition(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/support/v4/app/Fragment;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;
    .registers 4

    if-eqz p1, :cond_19

    if-nez p2, :cond_5

    goto :goto_19

    :cond_5
    if-eqz p3, :cond_c

    invoke-virtual {p2}, Landroid/support/v4/app/Fragment;->getSharedElementReturnTransition()Ljava/lang/Object;

    move-result-object p1

    goto :goto_10

    :cond_c
    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getSharedElementEnterTransition()Ljava/lang/Object;

    move-result-object p1

    :goto_10
    invoke-virtual {p0, p1}, Landroid/support/v4/app/FragmentTransitionImpl;->cloneTransition(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/support/v4/app/FragmentTransitionImpl;->wrapTransitionInSet(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_19
    :goto_19
    const/4 p0, 0x0

    return-object p0
.end method

.method private static mergeTransitions(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Z)Ljava/lang/Object;
    .registers 6

    if-eqz p1, :cond_12

    if-eqz p2, :cond_12

    if-eqz p4, :cond_12

    if-eqz p5, :cond_d

    invoke-virtual {p4}, Landroid/support/v4/app/Fragment;->getAllowReturnTransitionOverlap()Z

    move-result p4

    goto :goto_13

    :cond_d
    invoke-virtual {p4}, Landroid/support/v4/app/Fragment;->getAllowEnterTransitionOverlap()Z

    move-result p4

    goto :goto_13

    :cond_12
    const/4 p4, 0x1

    :goto_13
    if-eqz p4, :cond_1a

    invoke-virtual {p0, p2, p1, p3}, Landroid/support/v4/app/FragmentTransitionImpl;->mergeTransitionsTogether(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    goto :goto_1e

    :cond_1a
    invoke-virtual {p0, p2, p1, p3}, Landroid/support/v4/app/FragmentTransitionImpl;->mergeTransitionsInSequence(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    :goto_1e
    return-object p0
.end method

.method private static replaceHide(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransitionImpl;",
            "Ljava/lang/Object;",
            "Landroid/support/v4/app/Fragment;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    if-eqz p2, :cond_25

    if-eqz p1, :cond_25

    iget-boolean v0, p2, Landroid/support/v4/app/Fragment;->mAdded:Z

    if-eqz v0, :cond_25

    iget-boolean v0, p2, Landroid/support/v4/app/Fragment;->mHidden:Z

    if-eqz v0, :cond_25

    iget-boolean v0, p2, Landroid/support/v4/app/Fragment;->mHiddenChanged:Z

    if-eqz v0, :cond_25

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/support/v4/app/Fragment;->setHideReplaced(Z)V

    invoke-virtual {p2}, Landroid/support/v4/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {p0, p1, v0, p3}, Landroid/support/v4/app/FragmentTransitionImpl;->scheduleHideFragmentView(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    iget-object p0, p2, Landroid/support/v4/app/Fragment;->mContainer:Landroid/view/ViewGroup;

    new-instance p1, Landroid/support/v4/app/FragmentTransition$1;

    invoke-direct {p1, p3}, Landroid/support/v4/app/FragmentTransition$1;-><init>(Ljava/util/ArrayList;)V

    invoke-static {p0, p1}, Landroid/support/v4/app/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroid/support/v4/app/OneShotPreDrawListener;

    :cond_25
    return-void
.end method

.method private static resolveSupportImpl()Landroid/support/v4/app/FragmentTransitionImpl;
    .registers 3

    :try_start_0
    const-string v0, "android.support.transition.FragmentTransitionSupport"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x0

    new-array v2, v1, [Ljava/lang/Class;

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/FragmentTransitionImpl;
    :try_end_15
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_15} :catch_16

    return-object v0

    :catch_16
    const/4 v0, 0x0

    return-object v0
.end method

.method private static retainValues(Landroid/support/v4/util/ArrayMap;Landroid/support/v4/util/ArrayMap;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p0}, Landroid/support/v4/util/ArrayMap;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_6
    if-ltz v0, :cond_1a

    invoke-virtual {p0, v0}, Landroid/support/v4/util/ArrayMap;->valueAt(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p1, v1}, Landroid/support/v4/util/ArrayMap;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    invoke-virtual {p0, v0}, Landroid/support/v4/util/ArrayMap;->removeAt(I)Ljava/lang/Object;

    :cond_17
    add-int/lit8 v0, v0, -0x1

    goto :goto_6

    :cond_1a
    return-void
.end method

.method private static scheduleTargetChange(Landroid/support/v4/app/FragmentTransitionImpl;Landroid/view/ViewGroup;Landroid/support/v4/app/Fragment;Landroid/view/View;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V
    .registers 19
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransitionImpl;",
            "Landroid/view/ViewGroup;",
            "Landroid/support/v4/app/Fragment;",
            "Landroid/view/View;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    new-instance v9, Landroid/support/v4/app/FragmentTransition$2;

    move-object v0, v9

    move-object v1, p5

    move-object v2, p0

    move-object v3, p3

    move-object v4, p2

    move-object v5, p4

    move-object/from16 v6, p6

    move-object/from16 v7, p8

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Landroid/support/v4/app/FragmentTransition$2;-><init>(Ljava/lang/Object;Landroid/support/v4/app/FragmentTransitionImpl;Landroid/view/View;Landroid/support/v4/app/Fragment;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/lang/Object;)V

    move-object v0, p1

    invoke-static {p1, v9}, Landroid/support/v4/app/OneShotPreDrawListener;->add(Landroid/view/View;Ljava/lang/Runnable;)Landroid/support/v4/app/OneShotPreDrawListener;

    return-void
.end method

.method private static setOutEpicenter(Landroid/support/v4/app/FragmentTransitionImpl;Ljava/lang/Object;Ljava/lang/Object;Landroid/support/v4/util/ArrayMap;ZLandroid/support/v4/app/BackStackRecord;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentTransitionImpl;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            "Landroid/support/v4/util/ArrayMap<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;Z",
            "Landroid/support/v4/app/BackStackRecord;",
            ")V"
        }
    .end annotation

    iget-object v0, p5, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    if-eqz v0, :cond_2e

    iget-object v0, p5, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2e

    const/4 v0, 0x0

    if-eqz p4, :cond_18

    iget-object p4, p5, Landroid/support/v4/app/BackStackRecord;->mSharedElementTargetNames:Ljava/util/ArrayList;

    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    goto :goto_20

    :cond_18
    iget-object p4, p5, Landroid/support/v4/app/BackStackRecord;->mSharedElementSourceNames:Ljava/util/ArrayList;

    invoke-virtual {p4, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/lang/String;

    :goto_20
    invoke-virtual {p3, p4}, Landroid/support/v4/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    invoke-virtual {p0, p1, p3}, Landroid/support/v4/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/view/View;)V

    if-eqz p2, :cond_2e

    invoke-virtual {p0, p2, p3}, Landroid/support/v4/app/FragmentTransitionImpl;->setEpicenter(Ljava/lang/Object;Landroid/view/View;)V

    :cond_2e
    return-void
.end method

.method static setViewVisibility(Ljava/util/ArrayList;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;I)V"
        }
    .end annotation

    if-nez p0, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_9
    if-ltz v0, :cond_17

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1, p1}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v0, v0, -0x1

    goto :goto_9

    :cond_17
    return-void
.end method

.method static startTransitions(Landroid/support/v4/app/FragmentManagerImpl;Ljava/util/ArrayList;Ljava/util/ArrayList;IIZ)V
    .registers 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/support/v4/app/FragmentManagerImpl;",
            "Ljava/util/ArrayList<",
            "Landroid/support/v4/app/BackStackRecord;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;IIZ)V"
        }
    .end annotation

    iget v0, p0, Landroid/support/v4/app/FragmentManagerImpl;->mCurState:I

    const/4 v1, 0x1

    if-ge v0, v1, :cond_6

    return-void

    :cond_6
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    move v1, p3

    :goto_c
    if-ge v1, p4, :cond_2a

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/support/v4/app/BackStackRecord;

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v3

    if-eqz v3, :cond_24

    invoke-static {v2, v0, p5}, Landroid/support/v4/app/FragmentTransition;->calculatePopFragments(Landroid/support/v4/app/BackStackRecord;Landroid/util/SparseArray;Z)V

    goto :goto_27

    :cond_24
    invoke-static {v2, v0, p5}, Landroid/support/v4/app/FragmentTransition;->calculateFragments(Landroid/support/v4/app/BackStackRecord;Landroid/util/SparseArray;Z)V

    :goto_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_c

    :cond_2a
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v1

    if-eqz v1, :cond_5c

    new-instance v1, Landroid/view/View;

    iget-object v2, p0, Landroid/support/v4/app/FragmentManagerImpl;->mHost:Landroid/support/v4/app/FragmentHostCallback;

    invoke-virtual {v2}, Landroid/support/v4/app/FragmentHostCallback;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_40
    if-ge v3, v2, :cond_5c

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v4

    invoke-static {v4, p1, p2, p3, p4}, Landroid/support/v4/app/FragmentTransition;->calculateNameOverrides(ILjava/util/ArrayList;Ljava/util/ArrayList;II)Landroid/support/v4/util/ArrayMap;

    move-result-object v5

    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/support/v4/app/FragmentTransition$FragmentContainerTransition;

    if-eqz p5, :cond_56

    invoke-static {p0, v4, v6, v1, v5}, Landroid/support/v4/app/FragmentTransition;->configureTransitionsReordered(Landroid/support/v4/app/FragmentManagerImpl;ILandroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Landroid/view/View;Landroid/support/v4/util/ArrayMap;)V

    goto :goto_59

    :cond_56
    invoke-static {p0, v4, v6, v1, v5}, Landroid/support/v4/app/FragmentTransition;->configureTransitionsOrdered(Landroid/support/v4/app/FragmentManagerImpl;ILandroid/support/v4/app/FragmentTransition$FragmentContainerTransition;Landroid/view/View;Landroid/support/v4/util/ArrayMap;)V

    :goto_59
    add-int/lit8 v3, v3, 0x1

    goto :goto_40

    :cond_5c
    return-void
.end method

.method static supportsTransition()Z
    .registers 1

    sget-object v0, Landroid/support/v4/app/FragmentTransition;->PLATFORM_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    if-nez v0, :cond_b

    sget-object v0, Landroid/support/v4/app/FragmentTransition;->SUPPORT_IMPL:Landroid/support/v4/app/FragmentTransitionImpl;

    if-eqz v0, :cond_9

    goto :goto_b

    :cond_9
    const/4 v0, 0x0

    goto :goto_c

    :cond_b
    :goto_b
    const/4 v0, 0x1

    :goto_c
    return v0
.end method
