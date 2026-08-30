Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B5333F104C;
	Sun, 30 Aug 2026 03:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788061904; cv=none; b=XzuRnGOHvUAELVXJs4fC2L19H2x44RtpPw0Ct7DuTlfV/n/MGV3ozl7qPwMr87WEVOdF6uC06PGQnDZHYCcOW+iC/vveqr3v/GtehDsVHWohCXsuTjVaSmVX8+cWxRfd6Fk18Rx8NCQDM3Hm7GDeZlOJLtfvFkYSTXiUvYG7lL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788061904; c=relaxed/simple;
	bh=4Jxl+cZu4DRnu4rBqekORskTJvWPhGP7jYD7u4dy2BI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gwQgPUIpmkXs11nmgG0FQO8+V4PTiNtq5Y7+XXjpy2u5Xs76RVGK1xNPjjBF+79DzZ8WgnbdqFBPPvOyydo7yi/L3jxXT7p0qF/9CHs+eKYKMd4EpIqqyOnDfvL5fJWqR8OSh9iQibJ51znUTDHCzH8v6yjIG1sAv041Ot6Lgs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L2a8Z3qg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L2a8Z3qg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70FD01F000E9;
	Sun, 30 Aug 2026 03:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788061902;
	bh=4Jxl+cZu4DRnu4rBqekORskTJvWPhGP7jYD7u4dy2BI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L2a8Z3qgL4S0UFo9QOryw+TvOkXrNqDGf7XSmvYmRKy4gfLQx/+KWRnVvFxUxXIw8
	 hVCm9K/Z/yAU51C5XLPd2WfQmrgF8PtFALP8+aTBuYGwjxgR7tomz34DG5RdigIzpv
	 rmRyUTSnHkweWWo50U5tvU2+CEFVLmOl1+bMWB5e5FQSbvfJgdkymjodqnEpk9mQ9R
	 7iB+7vUan824R1j0W+FUHdFreZb1slKbPf0ISNEVclAaEkqlB/2OPOAILQGoc2BP3N
	 2tEPRtqaOGXFcy6g/E8ZbClNEuj3HjvUyE5r8QctsZAiWxeY8JT1onyGys4ZCgt2X8
	 rGS/1Sej9NvGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] dt-bindings: mfd: qcom,spmi-pmic: Document PMAU0102
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shawn Guo" <shengchao.guo@oss.qualcomm.com>
Cc: mfd@lists.linux.dev, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
References: <20260830034719.140213-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 03:51:41 +0000
Message-Id: <20260830035142.70FD01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
>=20
> Add compatible for Qualcomm PMAU0102 PMIC that is used on Nord platform.
>=20
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830034719.1402=
13-1-shengchao.guo@oss.qualcomm.com?part=3D1

