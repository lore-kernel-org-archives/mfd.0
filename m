Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF92433BAA
	for <mfd@lists.linux.dev>; Mon,  6 Jul 2026 09:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330522; cv=none; b=Z/iwbSlu5+RUUWidO2jx5PRcCvJ+XTicPAuWoFAPqw16fmhvq+GSCHloE2LUGxD5/Iq5HgpTSKJhc8gCdOMfglQ2Li78aLcnGntgYpOr3ZKCah8CK7rCt9mQDgTFLP7vxokCvdprbQBhcvfiQxZ8P8joKKvJBlkbX56a6LEw6Yc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330522; c=relaxed/simple;
	bh=8qM03uk3FK9p+JWi7ah2snfy3vtUfVTiV09NI8TxuQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AaaBq+BedLz6Q+LaSVq0tl/zd8e+RI7KK2uzy2+eCUS3juO+/jKzvtlF5PKUYjzf1WdbXeCwnYWEFNr8z3fSUJPao9YVsf8jkdnCHAVwyDwEm4x4KqNwG51EVmW3biHhsQtForrEvUOaUAjuGs14ezmwVQi/n+rC+NmgPW8I1mU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b0meORzl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b0meORzl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B14EA1F000E9;
	Mon,  6 Jul 2026 09:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783330516;
	bh=8qM03uk3FK9p+JWi7ah2snfy3vtUfVTiV09NI8TxuQI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b0meORzledmKgvXt8O08yWg82je4W6h27Ty1fZeYZDkKHtPVOqICDe5N4pstfU8bF
	 GuLKrTPSHlIroMb5jrHCj7jIlcjbRzuvB6MHNAE7p44AjTXTQubxQVsMdG3IfxH5I+
	 RtGxy9tp85J7jFmH8dwknnWRFVPZVB+UQ0q434pTagTurmd9McyKMKQ0vxIKCbKsV4
	 nyy+cDOxNmiN/LKf5hiZ+DC8htbF9ngp/7JB7EBEf2yU3yaHns7KYxv7IxQFpC5RWV
	 6B2Y4ml4YbwqkiiHC5ThAJE4VJjsTJsqOSiryw5KFVwJIjvDz2d38PIddmFqx/jyHf
	 xuBY0JRO43YDQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: rave-sp: validate received frame lengths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260706092337.78754-1-pengpeng@iscas.ac.cn>
References: <20260706092337.78754-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 09:35:14 +0000
Message-Id: <20260706093515.B14EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The RAVE SP receive path derives event, reply and checksum
> fields from variable-length frames.
>=20
> Validate event and reply minimum lengths before reading their fixed
> fields, and derive the checksum payload pointer only after checking the
> frame length.
>=20
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260706092337.7875=
4-1-pengpeng@iscas.ac.cn?part=3D1

