Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795723129;
	b=sMiv1exlryXGtqWn0Pbg9GxR99lqrV8Dkvd/l9cR5nLC/gh4qxX9kjV9ACHo8MN8+ASP
	 WtQaRUdn5FRU5sNOzqA94xNTAALGMAE70M62tLowt39GP78XoFfSQ4n6npYirQ0Pt2pqo
	 q1bGHnHUsI08KACLNR5P07E0bPt0Apw+srqTQIUD40xCWlibT/nnXr9m6Hpnb6k8P9XZc
	 ni5N1x1lGyUNcmOJ6bAqBs93GXxbs86UKUhWtm3UwbzSTEOylTNcU5ZG73OL5InyP7TF1
	 ztOxOxTFRcIDmN4JuubuHrXWoS2OuMgUH1O5z9R7+tWBIytU5VN4dJphEGaE2EdePiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795723129;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=fHn9LbOFwMcpwbie2YpZCXPK9JITnfo4j7miLCdlUuI=;
	b=2unZaiqOolx36wY6POdeObD/cJ/pLpst9KEGNP8RAl1EdT3wWMZHyBbX7Sy43M5gYki1
	 MLR2cBE0FYKEEMl01isYJY9xowTHlfBXZXoLuBUEMt8TNLsnynNxHISB69XXLCFwnzjv1
	 g6CMHkNikHgjoN8DqR5q6z5Q0emzzh1rfMECS41M2bvqKcLYfpX6+f5gYMJUa6AHh5Rw/
	 nU6raHiL4KR3Bv2pBGpkLuBWYHwp7IX2T7DmOumJNgCxxvj9svuzIXg33K6FT+yY2KEBK
	 lKWwsh5MvyHeK2BcLkFf/7Zl8MpbOymn5L7016Lemg7xET6IpKbBakS2xy3leTmavZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CByQdzNh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572C3606A31E;
	Thu, 26 Nov 2026 19:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CByQdzNh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C4A1F000C4;
	Thu, 26 Nov 2026 19:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795723128;
	bh=fHn9LbOFwMcpwbie2YpZCXPK9JITnfo4j7miLCdlUuI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CByQdzNhLEq2Inv1gxpj7hUO60PEBm9Vq0q8HrmOuRS0VvKdFpsM+ZEPu7AzHObge
	 qEPU/pCTNZmY1N8xCgH43AdP+pI1na8wCvWzhGqqeFGlw+m5Wii6+/LnXhNubjau4p
	 pTZJe5SoYr8n9B2nuns9n45BMiClyE/615e7P3q+bfJKmlQG6uqnm+Eav42aTuILJD
	 qT74Q5KuUSp/1tRKuUSA63pjbmF4c7tAM3m2OmcxX8t2bWF0l8NtgSogx1ATJhMtTb
	 Yhzk+pBVmqmeK12pt0jjkQz+thGtSLta+YSjsQxhKgqcrKpJWw8EQvItHe1tZn4xaX
	 cR6I+/+ywBn2w==
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 3/7] regulator: pm8008: Add mode voting support for
 PM8010
From: Mark Brown <broonie@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guru Das Srinagesh <linux@gurudas.dev>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dhruvin Rajpura <drajpura@qti.qualcomm.com>, 
 Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, 
 Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, Oleg Keri <okerixx@gmail.com>, 
 Burke Cates <burke.cates@gmail.com>, Christian Cortner <ccortner@gmail.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
 <20261116-pm8010_i2c_support-v5-3-5626ba17c0fb@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 19:58:38 +0000
Message-Id: <179572311835.838304.3101127250585330182.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=637; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ryj3DRMsuFieRXLEq4qm/wVztM2HM9StE1IE4w6O9xI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI5+vPzo624FsyK//rvuav06T1fjp6fui287HE0x5rVl
 alMYgcbO0pZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjARXz1Ghg7ZFwvYeITrzMwa
 XriuutOio5wWJrBa1zNYd1G+T5KMDMP/PJHVPtl8MXEq1vefy4l6zA+edOL4VzE/qzKDss/NXIz
 8AA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Implement set_mode/get_mode/get_optimum_mode support for PM8010 LDOs
> using the mode control and status registers to allow clients to vote
> for LDO modes. Mode voting is supported for L1 and L2 alone of PM8010
> LDOs and not supported for any of the PM8008 LDOs.

> +static unsigned int pm8010_regulator_of_map_mode(unsigned int mode)
> +{
> +	switch (mode) {
> +	case REGULATOR_MODE_NORMAL:
> +	case REGULATOR_MODE_IDLE:
> +		return mode;

These values would need documenting in the binding (or use the existing
HPM and LPM values and map them, LPM at least looks appropriate).

-- 
Mark Brown <broonie@kernel.org>
