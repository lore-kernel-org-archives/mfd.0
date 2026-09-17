Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E86A503BDC;
	Thu, 17 Sep 2026 12:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789649336; cv=none; b=ICP/293wSa0sxBio1ZhtX3UiojK/vGi5jBaxSTmC5SupLXuBPSb81MK7NxmXBJlaG9PaDdCqxVMVyziZWuNombcQ6mdZfz4eYu0J+Jy3CRnrd3xCc7dZJp+7LjkF67ayQOB2Cno5eD92hv84onpLEQ0b3xjj5mzTQ5JFBGMtyME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789649336; c=relaxed/simple;
	bh=ybPZwFWVbAcWQe49Qez6gagDON00RN7+CnlsMZKQbo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JrVLN1I3U8f6YHlH7w1URLtWKydeA1hT5FnIsFLPREjRGUABwgVjE/sNo9V7zIkTdUHdV1JPq4a17aQYPkQS6jxJgk5vKwJ9qsajG9n6liuq/kaoP2pBZ2sEw9HF4tUcszIQd4JP+HgSYTBDHkz9sEwOjMogHvd6XraGz3ess0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kb3jCSew; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kb3jCSew"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E4441F000FF;
	Thu, 17 Sep 2026 12:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789649314;
	bh=ybPZwFWVbAcWQe49Qez6gagDON00RN7+CnlsMZKQbo8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kb3jCSewOKOFL8NNhKRVo+SBUREc2I3GSS7xlN+uhQ/YuMinWgK8LkfAeJmoYpQxN
	 E1wuUX16tYt3EJwT4qpnuCujaemV3Lsb1gKdegqUKiFhEm/IbS5X9sYmxXaQBka7AU
	 wrGM2uwxymJ0mmD0MrdsHzs82UiwsmogjlLSjBw2OXlCcX3kKxkC7UYEqlHVBL9z1o
	 5UDltVEpxoFjgSd5NkPVgskP0pAzWWXHkcplKiX73cUAloUGW/XI64NWW6bN8EOp3m
	 tH/mYXXYK8inS6NZrdtuSB9etKZg4n7pZAN74DqV3emLR2OhiV1cR4t6vJNdXeKhxu
	 cmNVblCErq9oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: ti,bq25703a: Expand to include
 BQ25798
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Charkov" <alchark@flipper.net>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260917-bq25798-v2-1-5086845cd3eb@flipper.net>
References: <20260917-bq25798-v2-1-5086845cd3eb@flipper.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:48:34 +0000
Message-Id: <20260917124834.9E4441F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> TI has unpublished the BQ25792 charger variant and pulled its docs from
> their website.
>=20
> BQ25798 is a pin and register compatible replacement, which also adds MPPT
> tracking support (reg 0x15, added in BQ25798 and reserved in BQ25792) and
> backup mode (reg 0x0f[1], reg 0x10[7:6], reg 0x16[0] and reg 0x1c[7:5] on
> BQ25798 - all of them reserved on BQ25792).
>=20
> Expand the existing binding to include BQ25798 with a fallback compatible
> to BQ25792.
>=20
> Link: https://www.ti.com/product/BQ25798
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-bq25798-v2=
-1-5086845cd3eb@flipper.net?part=3D1

