Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534B6299920;
	Sun, 30 Aug 2026 22:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788130321; cv=none; b=aMYYArU0rPSgA/iCNaKP3Sx8aQR8vf4HeQ/KbKNdcOH1BrkbXXs54zDnVSD/x35po+QAmu14L/WpMSHKFKvVqHkj9m9YV53E52bRXJNeDnZ8k3nEkZb4S1lav9skOHQEthmapysm0Lng/1nctcSexhnHKXYIjjwDbkO1AFHipqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788130321; c=relaxed/simple;
	bh=JIgV2Xuxy28ycyMFbGVfWuptG5OJ8z92ryCo47X8HFM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JgOMgDOt2LU8kOz+WqiDmbqOJW8ZfkmlZgxxJaVQ+6dNKHdayQut36Z2pXH1apVnB3rVyFqS0xkYoJpX4lwATcoKc3qNnINV27TCU1B9DvOAqPjt167t2i94CJD5SIn83iglVkPebGTGicAXPv7/Tm9DrpKYaKzmKRJ4acjo2TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pk61Lhj0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pk61Lhj0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918621F000E9;
	Sun, 30 Aug 2026 22:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788130319;
	bh=JIgV2Xuxy28ycyMFbGVfWuptG5OJ8z92ryCo47X8HFM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Pk61Lhj0q/2zarYesrGiwbiYsbfkhl0XUSHk1nOsgxEqQ2R73Qmg2zHlXWEqG3g6j
	 pf3B+d0tcyIl7uk6hfLzLZjHiedCupB28bxfMPdeJa/sT8RbCsbKKcXRsw1CoP2PH0
	 N6Z2KbjCJ7A8U4cVPq1zobx/LYOQGe+Bg7miOJFrpA1ljnT0vpICl0OzveXgdHbas9
	 MgJf9vit+c/iuilQCIVDc0UnrQ7t/Fhh+JpPnI1vQI52UowL/3b+FPUNw39ILfPKXy
	 ZX89YIlZt4MxbBvS4mu027odPbSmnDkoPl3sBbFBt77tMEl7FluEg+aGJkl/hbrzbX
	 mQOm7bdRyz8gw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 04/13] regulator: ab8500: Treat cut 1.0 VAUX3 as fixed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260831-ux500-dts-snowball-regulator-v1-4-fe279fff5e18@kernel.org>
References: <20260831-ux500-dts-snowball-regulator-v1-0-fe279fff5e18@kernel.org>
 <20260831-ux500-dts-snowball-regulator-v1-4-fe279fff5e18@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 22:51:59 +0000
Message-Id: <20260830225159.918621F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The early-cut workaround currently gives AB8500 cut 1.0 the 16
> programmable VAUX3 settings introduced with cut 1.1. On cut 1.0 the
> selector is not programmable and VAUX3 is fixed at 1.2 V.
>=20
> Register VAUX3 as a fixed-voltage regulator on cut 1.0 and retain the
> 16-value workaround only for cut 1.1.
>=20
> Reference: AB8500 User Manual, UM0836 Rev 3, p. 240
>=20
> Fixes: 2b75151a1041 ("regulators: Added ab8500 v2 support")
> Assisted-by: LLM
> Signed-off-by: Linus Walleij <linusw@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831-ux500-dts-=
snowball-regulator-v1-0-fe279fff5e18@kernel.org?part=3D4

