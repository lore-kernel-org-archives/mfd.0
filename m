Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E08279DC3
	for <mfd@lists.linux.dev>; Wed, 14 Oct 2026 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980553; cv=none; b=AsXg8WS2fyH+3D00efpU44HCH4x3vidmdD0VDKni7whYTTPDtgv6FN4liJsqLw619dPKodEGoLLcK+hn4NsDXZyShnnlnzt9XWV+hVJWlZXeoeS/uwmRdWoygcXMvJD7xojqMsYx6fiICec3pgUpDXVwgShqMz1jOwZSGbX92BM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980553; c=relaxed/simple;
	bh=uI1kqH3CEJPOBkmT2ztK0E8497KyeZz30946ftu5fH8=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JBBskkIranBC/mjKfuEY4Zptc+9BnGqZNCkYYJ40vW+VyRGTy8MlIKTT8PsU2UrysHKrHadHm9GFqc4C21PW4lir5GbYlapUGAe5OlbCiQUKm1FcB4qnZObSZrIjUzFMEBpnjC3QlgUUM+wAw2UODGyOyNvcKiFWism104rwFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PF5kDKs7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PF5kDKs7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345901F00898;
	Wed, 14 Oct 2026 12:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791980552;
	bh=uI1kqH3CEJPOBkmT2ztK0E8497KyeZz30946ftu5fH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PF5kDKs7LDlQ1PQMk0uobSDcNIxEtooEOOKPYoe970CNEw59KFweOKl08Zl/NGijn
	 VESFHG1VCHOBaHlfuNLAXsE0qM39bLmcL79kdLxKIm+i6si11DvN/fT8glsSYCfqIF
	 MyYLSsDwZKxaNahh/v/iBcc6BCezi1vEe7IxysF/NM5v9hkmVgZSn9D85IOD05x9s8
	 XKwCYrQyoP/n0Su+622AoSNBHDBYb9Fi9R+gG3BkUBnnouIwp94Wg0elDyKTW1CH7W
	 qdckJLv6tyebmAyy4VuWdawLQzdiJJbvibevJ424tAsrWALZy9vcP1bXolRLWjFSJx
	 gIWMpq7PCXMSg==
Message-ID: <sashiko-outbox-171269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3 RESEND] regulator: dt-bindings: maxim,max8907:
 Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261014121544.138958-2-clamor95@gmail.com>
References: <20261014121544.138958-1-clamor95@gmail.com>
 <20261014121544.138958-2-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 12:22:31 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> Convert Maxim MAX8907 regulator binding from text to DT schema. Reference
> to nvidia,tegra-regulators-coupling in child regulator nodes.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014121544.1389=
58-1-clamor95@gmail.com?part=3D1

