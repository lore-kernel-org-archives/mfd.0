Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6974A205D
	for <mfd@lists.linux.dev>; Thu, 15 Oct 2026 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056138; cv=none; b=qSdGwJBcsVZ9f+5Gvx0iTwt/tKvMjqa7bTHsxH5thew5hjCXd0Wig49e4Fad5uMbolLoFIm1kUzG12S/IA7s4KEY0GNwz/Yci6w8YmG9JahMvEafIfSum79XGQNB5igP4MOqsfTHuM12VFCFNr/p7tMPsoQ81Bb4LMgJe+4cANI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056138; c=relaxed/simple;
	bh=u7EThH1EUcDCH1j51Fk2xvdOoJ9o3aZAtxMnLIfvtys=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=RkgkcFQTwmJs71jGWOdETqaF6IdMS4zaeAxe00W+MpzAKM8QGnPcBGqlXU835AoEEwZgA5/We8XZt37DmhN9dmpNUMmlri1Va1WG4g+OB2ApjEnkp+9MnFfsGmLZTRtzJHzwRsf8bRYzIW+MwzgtK430/xPZYSLnxKle4UHPsys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SDIih5gK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SDIih5gK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7F61F000C4;
	Thu, 15 Oct 2026 09:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792056137;
	bh=u7EThH1EUcDCH1j51Fk2xvdOoJ9o3aZAtxMnLIfvtys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SDIih5gKu+lFgUgufzfGz0vc4njvLc2VWxNQn11ZWuzC12KgIAH6hHHkHGo7wnmQw
	 Lg1+JPXwa5ZjbR6rrIXWA4hQZhdrjAwn2Kt1e7/G9TrgaYemaCWxsyCVtclX04ZID/
	 8hDLxsIWi/d3rpM0ixnPgoL0is6TkNqRdMbfd54EFO53ueZCeFhRFSxotpcX8P4MMg
	 HkyK1S7lpK1zB2vpRJ5V1EWNTTw6WDdJMbF2+f3mrGWbS759Ujsya7/ygIQ8s2B4E+
	 MlXpFvVUExen49/bikotTAj6r9edAe1cPprYbQjqdhbtYzoRyoANjPOCfVDpCCkANV
	 wLesl9zYB/WPw==
Message-ID: <sashiko-outbox-172564@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/9] dt-bindings: regulator: add Qualcomm LCDB regulator
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
References: <20261015-sm8150-display-card-v1-0-5c14928cef29@oss.qualcomm.com>
 <20261015-sm8150-display-card-v1-3-5c14928cef29@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 09:22:17 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Several Qualcomm PMICs have an LCDB block providing the positive and
> negative bias rails for LCD panels. It is not supported by Linux, so
> boards using it either model the rails as dummy fixed regulators and
> depend on the state left by the bootloader.
>=20
> Describe the LCDB regulator present on the PM8150L. Use it as a fallback
> compatible for LCDB blocks on PMI632 and PM6150L. PM660L has a different
> version of LCDB block, so it's not being covered.
>=20
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-sm8150-dis=
play-card-v1-0-5c14928cef29@oss.qualcomm.com?part=3D3

