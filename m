Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E95C3264D0;
	Sat, 11 Jul 2026 06:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783750005; cv=none; b=dBC0NgHD8/KDyCyZx0W04u/SLjxh8WFPFjtbMqt4KyYQBNcujxpwwI9n9kiPXRCmCNRxW3C6r5PPrpX0nIUPCwosbX2F01WxL9P4UhNl7DtpIj/fi1Z4/sGV2s9w6Nv1d4ZdxAlumJsn1RaYgw/u8AUZpi9y6G0jD0uatEA1dHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783750005; c=relaxed/simple;
	bh=AScS5Hu9MhskSZVYZ+wkLIepGShss4ol+Q0/xHE6sXw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hjlf2a+/5VZBkFYIf8/JSo6CLvEinXZLLHCsp6zG6nc5YNB6poYlNuie8saspdAmyaGy73DWwbsEwJqRHp3sGESRV3dod4yG4EMnVqjYPdMcK1fQ8ogpcBEEkgTy1yjeHkym+Kg10o8iIw4UR0SR030uUsWbUuusilduPxjZ5/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JcbUf8BK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JcbUf8BK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0CC41F000E9;
	Sat, 11 Jul 2026 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783750004;
	bh=AScS5Hu9MhskSZVYZ+wkLIepGShss4ol+Q0/xHE6sXw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JcbUf8BKqR6V04qGks4ExkRAp7s/TnN02xCc6a/G3D2joCiHHbE3vvaRdAqBX486G
	 ZLbednDl50kSPsdrYn0J9LdNWBMlKS3OruJb9MNfxx1xqMGxB7YdxIqbdsGRI7rqin
	 xZLI3oHGnkLNTOgDgrFo0aJgv4JCpYO5WhuJ7yL7qtW7c6Jh2f1+tdHgl4A69Cki+1
	 qI5Ki+YZcx76evokg0TcYxtEpNotxYXpe5ex5IxQor3Phokx+vF9QQxFygViRVjcT4
	 E5hWx+WO7Qjepes3jc2bZwA4mjIJvzk1sT7ISGQXFKzi4aqITml7DGjbl21saLQ5Gy
	 Xb37DGfFDiTWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/16] arm: dts: omap3pandora: Don't use DMA channels
 for unused SPI masters
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <129b1ff8e73235c74ac66dab9041672190065785.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <129b1ff8e73235c74ac66dab9041672190065785.1783749722.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 06:06:42 +0000
Message-Id: <20260711060643.C0CC41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Grond <grond66@riseup.net>
>=20
> On the pandora, only McSPI1 (spi0) is actually used. Because the device
> tree defaults in arch/arm/boot/dts/omap3.dtsi leave all of the mcspi
> interfaces enabled, the DMA channels which the device tree assigns to them
> cannot be used for anything else. This is a problem because OMAP3's sDMA
> controller can only have 32 DMA channels configured at any one time.
>=20
> So when we try to use (for example) the McBSP subsystem (which is required
> for sound) it doesn't work because we've already exhausted our available
> DMA channels.
>=20
> Fix this by disabling mcspi[2-4] on the pandora device tree.
>=20
> Signed-off-by: Grond <grond66@riseup.net>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783749722.gi=
t.hns@goldelico.com?part=3D5

