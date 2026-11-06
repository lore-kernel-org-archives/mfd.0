Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793974658;
	b=MJ+/z/BqXSqs4A6krqtyo9ypJ1t84uMjkhEQ7odK62ZZd4mLsOdeI1CSYFvi66hlbIyt
	 Z8HsMPHYp5q1IbWBPq64oPPULwHEgEY5URR0jvpMEoRYdk8fMq8bsnKsimPYUIOSRqMyt
	 3wKyldeZfitPgVksk2hI/MKbGd37xW0Da9v1dFL0A0A91UXJ6Fh70L6+qQCfkOCTIL9kf
	 vfY4YZ8ZWken0c6eXjm+nY7m6dsKlU/Y3dq+Wf5jMT8lcoLrYQ6/IzWvwtrHrOKlc5Aba
	 ncQn1u9MHQGnI/eTWEoEaRQJaVf1v7j/LvDH5ZIbwKF8epEjN1Gp3O9ULWN/qi40CuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793974658;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gcol464CeQaLgdfO4bPvIEhbxy3GJWLSwmVsWjG5cy8=;
	b=2XpXnLjZzaUdJDMMCJ2en0TcUbOj54HSL+1d5Pn4le5X35mgWC2ApPY+1/JAwyipG/XW
	 hiKuwpTjBzSOW3UKrEUiuVNl69Win9ynef4VnZI8RG8r8jtWc/lJvxZ1Oy7bsh2Bq9ZDv
	 vLWecqEpZeH/2Ls31ZnQVXoEFIID4CfMmty9OQJM4NM5bxyKKGZQYO4I9/s8YzkzS87Gi
	 BnCHgYxoEhgNCi3I05ROrpaaYN8Z5rFP1F66D00aPxzUvRU6D9HbuHGZYrWQSTCEfdbK+
	 VN/g4bZqH4vcQxeTmL+0zKqEYwbnFz6bCMp7gk3Zq4Ox/VCF5ToaQzNzcTV9YR0ccmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDePzUOY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0987606A32C
	for <mfd@lists.linux.dev>; Fri,  6 Nov 2026 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PDePzUOY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 566A91F008A6;
	Fri,  6 Nov 2026 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793974658;
	bh=gcol464CeQaLgdfO4bPvIEhbxy3GJWLSwmVsWjG5cy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PDePzUOY1797lnZ6TpdG0h2fUJoVS1qJHbASFaKCQHYoGxkby30/Sie9wj6cQhTNA
	 9YBX77H4cHaatM1zRnn+xWWCoFNOoTIr10lqed6G9NuteEUQav+qkIWG6mHfrGyOUw
	 8xOAyg6zZAR2Kk/i8WYjcI8sWY2QKyawP2JEhEBk4PqgjU2poNvTfvQhckRq4EbvTS
	 GYKPE0WByvBfsfv4KG2DAs6ATBYheK2Qs74OE3URkiWH4dR7woe/iOHipWAY/raMQf
	 c9T4U+OxxqLjcVk57SN56cVqy9xrmu9LlP7j8a5koaF6O3sSnrwMHaJsNGgF2uoXcZ
	 L/AIOwzuWJzjQ==
Message-ID: <sashiko-outbox-201563@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 7/8] net: dsa: soce: Add basic support for
 SoC-e switch IP cores
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261105-devel-vstrassheim-soce-dsa-ml-v4-7-02f3cde2afa1@linutronix.de>
References: <20261105-devel-vstrassheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de>
 <20261105-devel-vstrassheim-soce-dsa-ml-v4-7-02f3cde2afa1@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 14:17:38 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Add a DSA driver and an MFD parent for SoC-e FPGA-based Ethernet
> switch IP cores.
>=20
> The MFD parent validates the core version and populates the Device Tree
> child devices, including the switch function, integrated MDIO controller,
> and MDIO mux.
>=20
> The DSA driver reads the licensed and implemented port counts and
> synthesis-time feature registers. Require DSA support and between 3 and
> 31 implemented ports, without exceeding the licensed port count.
> Derive each port's phylink capabilities from its phy-mode.
>=20
> Reserve and map individual switch register blocks within the parent's
> MMIO resource rather than claiming the entire IP-core address space.
>=20
> Enable "All Frames" tagging and the hardware DSA custom rules during
> setup. This isolates user ports and directs their ingress traffic to
> the CPU port, leaving bridge forwarding to the Linux bridge.
>=20
> Disable all user ports during setup and control port ingress and
> egress through the DSA port enable and disable callbacks. Disable
> tagging again during teardown.
>=20
> Detect the synthesized STP feature and disable it during switch setup,
> leaving STP state handling to the Linux bridge.
>=20
> Tested with a SoC-e MRS 25.01 IP core on a Xilinx ZynqMP platform.
>=20
> Signed-off-by: Vasilij Strassheim <v.strassheim@linutronix.de>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-devel-vstr=
assheim-soce-dsa-ml-v4-0-02f3cde2afa1@linutronix.de?part=3D7

