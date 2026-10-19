Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A084E4C54
	for <mfd@lists.linux.dev>; Mon, 19 Oct 2026 11:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792409338; cv=none; b=cA7RiFa2OYi4j+Zfuu/OFTUjM8MNhuoAdJzZlnD9Ds78VY88udKcqkWBAPoesva/TfSDavJmQmXg9DJnHa7T2IydYzNmiDoll/iXW93aqAAVOw2iQRsTCHFwZhjst3XSEP17LVHYxBCa5Z+AY6FVoW7uhizNSnKKjRH5Qt20P3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792409338; c=relaxed/simple;
	bh=tN064+YVL1NllltMW8MhgTJaZUEl1wEnfCboo6ai79A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=h/NN9wIjULFNW+NKTW5/j8wO8A5DlKvPifJGbMPN7tePpi2Gy14b3E9SGoIH70b+DRkCiIY6s9ZciI5bQKH89ltx+0DOvxkhxtGDt9IW6v09RAqrCbykxufbLKipaKogndulK/X0h4hv1zA4SSgg8x1IhMR81H/4bmda/XxkkPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mUZz8rdW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mUZz8rdW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA7871F000C4;
	Mon, 19 Oct 2026 11:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792409336;
	bh=tN064+YVL1NllltMW8MhgTJaZUEl1wEnfCboo6ai79A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mUZz8rdWoLn8BBiSihJmS7BQBek+Jdkqgxg2aF663JskcmXXXk/rECyEUd9F4qnNC
	 Hw2QSxOtdXrCUsQBWu0lBL8pqcJCKVOoEUy8RW6ypjt6DWdyguIkt1XsRUOzYw2IOU
	 UAB3ss+NtplrhNbw/kisM0ahZT46sLFt4CVWFMdoff8SFh+ZXzxjuiXrODz+PRBZcN
	 2zNul6EJ//g7L+08sFfzdWfi0lbPa4sgLs4pF3eXSfDpdX9g4lFez8mkm9pevnRUdw
	 9YGQYEKfOJ21UyXgTqQ3dXOgHswtpELq1+RqZ/0sbUs7acLSMuIrHgBJngRwE/jL4r
	 iOd5M4fiZL4HQ==
Message-ID: <sashiko-outbox-177038@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/8] arm64: dts: qcom: pm8150l: add LCDB regulators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
References: <20261019-sm8150-display-card-v2-0-86c05068efc5@oss.qualcomm.com>
 <20261019-sm8150-display-card-v2-5-86c05068efc5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 11:28:55 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Describe the LCDB block providing the LCD bias rails. Leave empty
> regulator nodes, forcing board files to provide correct voltage.
>=20
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-sm8150-dis=
play-card-v2-0-86c05068efc5@oss.qualcomm.com?part=3D5

