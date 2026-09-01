Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B6142AFAA
	for <mfd@lists.linux.dev>; Tue,  1 Sep 2026 15:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276024; cv=none; b=bih5g3AStOm3LjuVb8dcM1KWO02Tbt5IYXoPSnktNSsZ9+jJUt6FRdWnM/HUAzkGmzyfRdNj8yYfS+TAbf4PTAM2UcsVYKS6XzXFiwh+3uiUf/APTquyYv84x+5PhfLF1u0IEPNrCuN3FnmJkO5IN4zJwZDCm7b7YBBN9bo3798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276024; c=relaxed/simple;
	bh=B0H4Qa8VKXEjR8UMlAgKILBikS9G+hEcpsLuqIW+MUs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mfJDs4ATko0cX4seJs+7C/6Gn+TCmAXt6K3claC4g9MS1cGhPzb9ukh5e2tVP9ckK7Rqi5pcJhv3hOUDqxsPcc88h0UXXqyeSj43MHPyhyniKNSO1rQRmq2x8SihdflwnxGg4RM9kAn+oRQeVHqkcVb9U1D3itxytGGdCDymKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RjkopAxU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RjkopAxU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666B11F000E9;
	Tue,  1 Sep 2026 15:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788276022;
	bh=B0H4Qa8VKXEjR8UMlAgKILBikS9G+hEcpsLuqIW+MUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RjkopAxUc+vl2zycs2Rt1xZuzuPlpBHrQpO8BnGwSA387n7//mOdLSziqJ1wukY/w
	 //7j+QZkIMiVOJzP7Facbb8Wu4KjleAfy/BHrcHaaLJwTIifPFLuMxfwFxuCvg2a3p
	 OSNzMBi1cZaR2ShkTlRrTLfXbf5COByCELYONQ6XydwohMao7oQR/JGkZOSnFq3ksU
	 QwckRT5UksWOVumjoypiUB6ZTbQdLT/3Of4JjQqTqNcYt/bHnU19GCM3aq1RFZsYZL
	 x4FgId7OCqc2b5NQI2Ii0BINJHFBDdTRXhd8FutYzbjogZmMrXrhS7fZI4iqzebIt1
	 a/4Ar+it7jYLA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mfd: cs42l43: Add support for new cs42l44 variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260901151417.2546618-1-ckeepax@opensource.cirrus.com>
References: <20260901151417.2546618-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 15:20:21 +0000
Message-Id: <20260901152022.666B11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The cs42l44 is a cost optimised variant of cs42l43b. Add basic support
> for this new device.
>=20
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901151417.2546=
618-1-ckeepax@opensource.cirrus.com?part=3D1

