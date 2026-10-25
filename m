Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792958876;
	b=1gog+xc9E7W9sHdZ2f/4a2tqfzXfPD+iPQ34eusUKubhe0yGIfT00l/rgfhwfwYAmgx9
	 7T7RJ9SQELlGr2BKdxqPPz57BB0eTl/okPd6caZTy5keFoCXziZxbIyZrwgfih67ewg2q
	 HWgVS0FIWkut4jj76eQXT69RejaABmzUSFHMQVdDQXleqnRtcHmGBkZ/aCpJSZ7H2ObhC
	 N+0Ikfd8HpHM/hqwm8p/PSs2txRCjt/xxtGA3lIU4NzGNp+JaWnyOgyRhVFarsy1EMTfU
	 AgnXUmzA3RS4p+PIMKqZ6fs5xx39/Ba66jq1B3qhe/j7rhL/zIgGgCWRvvaJytEpyXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792958876;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PtuPN1i+sNRPp+y81g2GlSSVyogHTn2ceWFXJcpWsrY=;
	b=V1+3lV2P7HyV+OwaBXLnxX4IUZvOtp1EoCxP2VPvIDw5mVjz/oUg1nN96gNijkQSrPIT
	 GBEGJsbuJIOi9fLxl897pWTJXLHJ3FE6U6WozH4hbZa0hdDVA2v8mX1gH8JkdTfkhOd0e
	 YsDEwDxWxYsxQ8qC8GFD9zzk3DxrcBnawuUzyIdF/RV7trq3tmGsewLddsCGcb2jIMrjp
	 KRQtfpDwc+Y4FTnZy/X62VDelA0Xsd7yHuv9IJ69tIiJp7903Cigm9om8CYfjPEDjrTEq
	 r7DrgE1DN8OTldRbJSBCHhqhcFqUHKdgp1Mmr2vzA0bG/XOLrGkPXnN11cLo2iJvXQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lVm7ywgZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04758606A31B
	for <mfd@lists.linux.dev>; Sun, 25 Oct 2026 20:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lVm7ywgZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA811F01825;
	Sun, 25 Oct 2026 20:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792958875;
	bh=PtuPN1i+sNRPp+y81g2GlSSVyogHTn2ceWFXJcpWsrY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lVm7ywgZfulj59nha55uJ9jg4AvtL2Dd2bg+x9pMIIKywKZaLnBaH0kMTZVBdUrsa
	 Fx9b3lvf1CaiYjMeFbR9JAJX8c8DKXJOKBM/0ADVZhMGcCIsK6zbubkCRg/QX9DB32
	 8QNQlhGJZqJ+dXKKrebLxvfjxXmlgx+IcahUyoJMPgAatNohiBiagSzlnngqdeRKWQ
	 CHzG+bav/JMIQWzFvZRulguA0nNJ89lAusI2NVOrKluzCGzYRQVxXxpgbxTXdS3VFH
	 TWS1RZ35rwSoQkw2wV0tzUplsPoSYq7swOy8/jjpMPBrKyPj+lviBNbH3Jps/vOi77
	 M8GU+jYCAfwdg==
Message-ID: <sashiko-outbox-184407@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] mfd: intel-lpss: Set d3hot_delay to 0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Navon John Lukose" <navonjohnlukose@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261025193613.278610-1-navonjohnlukose@gmail.com>
References: <20261025193613.278610-1-navonjohnlukose@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 20:07:54 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> Every runtime resume of an LPSS controller waits the default 10 ms
> d3hot_delay in pci_power_up() for the D3hot->D0 transition. Nothing
> misbehaves, but the wait adds latency. On Arrow Lake-H (Lenovo Yoga Pro 7
> 14IAH10) the touchpad's I2C controller autosuspends after 1 s idle, and
> the i2c-hid interrupt handler for the first report afterwards takes
> 12.6-14.4 ms.
>=20
> The PCI spec asks for those 10 ms, but Mika Westerberg pointed out that
> the LPSS controllers are not really PCI-connected devices, so the delay
> is likely not needed. intel-lpss-pci already clears d3cold_delay,
> quirk_remove_d3hot_delay() drops d3hot_delay on several older Intel
> chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
> mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
> same for the Intel I3C controllers.
>=20
> Set d3hot_delay to 0 as well. The handler above then takes 1.1-1.9 ms,
> with no I2C errors. Only Arrow Lake-H was tested.
>=20
> Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025193613.2786=
10-1-navonjohnlukose@gmail.com?part=3D1

