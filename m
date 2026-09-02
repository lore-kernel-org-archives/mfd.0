Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A200227EA4;
	Wed,  2 Sep 2026 13:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354402; cv=none; b=rQOpmVpph7m77u2FSi4TTyr6AI3R5breuUhzXEkPQUKG4lUNP1aY9ge9Ahn4vh8GnLNTszix+Za3c4y8H3Ll5cbjvxskjDEyNPXb089QCASJRP5ipqFSyWcFFHi7zA7XPImR2i1IbXGdc20k5pLEjb5heOPXjRIGxr6dmhF804w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354402; c=relaxed/simple;
	bh=0E+tufsgZSzpfaAINdE5zzKAF+s6JloqvT1VVMs47X4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AmkXer0zEps+P2mxJihIEAd+mccSI94q8xJe4gLsbIgsm5Clo0cdStk2HltqPV4gopxrBdghAa41TTx052V1qM1ppRucg6OjDi1YNQc8NhF6nbNmD0Y0gyVl6E4HFxc/JneTm3k0e0VmXAAY1znvxPF2YbZOamBsOyrUgSgfjPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0288I+h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0288I+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693871F000E9;
	Wed,  2 Sep 2026 13:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788354400;
	bh=0E+tufsgZSzpfaAINdE5zzKAF+s6JloqvT1VVMs47X4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E0288I+hHqc1Qieaqry5IKJHp/xjxWbn4EdOIFOFJiyGaUnEt8qWS4CTYtOqSxZxg
	 4h+boyX6Vey7bdG0KXLLwkFh8toPU3ZFsU4VwjYz82AYS509lfDAaXsX9ZMo52grGN
	 YSbW6rwXXJE4NxE/wNDqebU8NlKnfnO9V/3J732X2pDqdcbnwo+fZFoRveFMgbNgl/
	 7xj3Tw58//F6MsxIqN8PK/Aiv1f45d4i0k79To33udy+mmyoSTQ9zdoMtAdvqQZ26F
	 1kB2RBHQn78i16Vlm1EspH3n/BG01qZ+jWrv1UpYqCbT/H+9h9qyks6VVMilP8CeeR
	 Ne9J4m4SuqrFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 6/6] arm64: dts: amlogic: t7: khadas-vim4: Add i2c
 MCU fan node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ronald Claveau" <linux-kernel-dev@aliel.fr>
Cc: devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260902-add-mcu-fan-khadas-vim4-v11-6-5f1610d83bf0@aliel.fr>
References: <20260902-add-mcu-fan-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr>
 <20260902-add-mcu-fan-khadas-vim4-v11-6-5f1610d83bf0@aliel.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 13:06:39 +0000
Message-Id: <20260902130640.693871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ronald Claveau <linux-kernel-dev@aliel.fr>
>=20
> Enable and configure i2c MCU node to get fan working on Khadas VIM4.
>=20
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260902-add-mcu-fa=
n-khadas-vim4-v11-0-5f1610d83bf0@aliel.fr?part=3D6

