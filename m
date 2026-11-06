Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974658;
	b=nmSxpwA7mmkfDHfuTr6XmryKntDh5Lf4J9SlilZETFjSJ2dKH3HeeyiqgMNIkE2mBz7K
	 KQj8ayRHscmzAvbUMLr+FqZmv7EEJM0/44Di/WTc0YkhvuNzZSS3hY8tCcKCuSVMnYV+Z
	 IBGZ2IiMaoWFIzzY0oXr5XcH6gClxenYIszQI5D0f7ks4e6OQAzn853lnoqOZ+vPLbJyz
	 stS1pe5bjH0ERO8OgtXeNXGK6q0Uyynx9Os9Qkazc+3FW+1H77HOfsq4ioVcRqYUORBij
	 qWRUJ5GhSJpqaagYxTve1lCscN98JvUmP5pmdNBtu2OeBFdAY3WKPAURaPTa9cqydQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974658;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=99YPv7LkyJmqOnSKObpsPBvb1s/QOBQ5o2czmbeF69U=;
	b=As91fy/zHmGxvISCNQ8NghlwXWSKlcKLR3an3kbMoyB6OlixPozcUyFUQmHqkCZIv/Hb
	 O7ArV1PK6JLOLhMPwGLjxyW1JTDxgybdX/Y6eMfbF7RQ+jopIWQL9kGhnDPgG61ZtS9bC
	 DPbVwtz2VZAO+BZc4GtNUfFCRGaOWAzASqFFv82MUOi9JsuKQwXdDBFYTjWy61gEpz4Ln
	 HEHcjkSAkCUviXdVSMvbaz81ocxOKegBrsm5rJB/74ye7+WHADHsjRqaMnEa6QmhAX6CZ
	 FfZ/1QxEs2PILcvVGQAOy9TBx430VqqykGXnROrWfCwCMbPcxmzRZH06QizdOoWYVTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoFA6++h;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D3F606A331
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VoFA6++h
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9111F0089F;
	Fri,  6 Nov 2026 14:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974657;
	bh=99YPv7LkyJmqOnSKObpsPBvb1s/QOBQ5o2czmbeF69U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VoFA6++hwyo43zH7Ta0Fq46j7IDzI37b5TFcXSeHy7DOEu79nfgCIEAMPBapX1mu1
	 OrNmbJB03wlC5cLxzQx3fDEGVyzVko92hzdz25rJHe8wf5Yrg2MHzMdKeCa/2se3f9
	 7antFLT4vYcqpjPUP6/mAKGJOEyrc6HC/89ab0/DBrSdKxAei0TTZfX4EAnRVP1Ckl
	 IIBrzkHQlQpXcenUhGNj7U8gWz6l11zCILAdQhishfRHECIomJM7ByHY+/E5sl3Kh+
	 ZyEKukPd0zIDVPpe1rXynXx51Iek4a2mCRnwQvSYD8Z4N40XCdS3+tFIOivFQuU7nQ
	 MyDg2cYi1Ei7w==
Message-ID: <sashiko-outbox-201562@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 6/8] net: mdio: Add SoC-e SWIP MDIO
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-devel-vstrassheim-soce-dsa-ml-v4-6-02f3cde2afa1@linutronix.de>
References: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
 <20261105-devel-vstrassheim-soce-dsa-ml-v4-6-02f3cde2afa1@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:17:37 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add a driver for the MDIO controller integrated into SoC-e Ethernet
> switch IP cores. Support Clause 22 transactions and the separate address
> and data cycles required for Clause 45 accesses.
>=20
> The transaction control register is shared with the external MDIO bus
> selector. The selector occupies bits 26:16 and is managed by a generic
> MMIO MDIO mux through the upper 16-bit halfword. Access transaction
> control through the lower halfword to preserve the selector bits.
>=20
> Check that the controller is idle before programming transaction
> registers and poll for completion after each transaction cycle. Return
> -ETIMEDOUT if the controller remains busy. No abort or reset recovery is
> implemented.
>=20
> The idle check does not cover selector writes: the generic mux changes
> the selector before invoking the controller callback. After a timeout, a
> subsequent access to a different child bus may therefore change the
> selector while the previous transaction is still active. Whether the
> hardware latches the selector at transaction start is not documented, so
> such a bus change is not guaranteed to be safe. This limitation is
> accepted when using the generic MMIO MDIO mux.
>=20
> Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-devel-vstr=
assheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de?part=3D6

