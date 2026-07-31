Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 099303B71CB;
	Fri, 31 Jul 2026 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785491464; cv=none; b=RZ91vV9cXRKYu1AHDmQNfuwMOuukt13/g1UtjjG2mUTcTWY6ZmVjKpUSNLIn4s/o9CpJfuModc604q0qq41l5NfEQTUiQiBgi5LdZ/dF7FDcCvDywx8M029AxF28pjQOSDBMxNkZghXwKe+w7ZTKh4pVCkpGb2FrgcQljPr+HUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785491464; c=relaxed/simple;
	bh=mRih7ny6r6/XvVsnba9QDfLyyVry8ONz+4AsFoj3nvg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Rr7jgEzg1CEk+C5qApGjOQhKnH4aANHHeZIXoxG6h4nMoMvRCMKv/O9RWClepSAzqeNBf1owZljCCB6u8PP7At7GCVQph+qYEplSie3Fn9+yyEQRhBee8C71op5/4Ar+t3Ua6v130+V6Mo08CESES/kXtO5VgT2OefYGcrnBpN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i5+J3C3z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i5+J3C3z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372391F000E9;
	Fri, 31 Jul 2026 09:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785491460;
	bh=mRih7ny6r6/XvVsnba9QDfLyyVry8ONz+4AsFoj3nvg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i5+J3C3zvNqEyfOwdGh/JOZJQNsGEv0auCIx2gtFqPo/6cyRO54icbum2Y1W9b7rd
	 4ZAOQBcGHfj6qh96yclQdSi9GAQV2RTVrc2jTooTJHi1jh6p9s+tbYD7EGVtDZ9ish
	 KYwa1sPdW5N6F0H4gIg9QS0Dy2haBXr9EKpNoeUByXllCM6ghs1cKnQ3xmPrl5DmFO
	 545joj91Pj/r9m0FSmzVGY4OVBcoRAHpPyJHCkFEtDjMis2Y3WhhOPyPq0HAlARhgg
	 BX7lSs7yF4mpV46ulK58EAzywtFONBv6R+MklVRUGQ1DITL+YSqc4aW6otvq/N75kX
	 0qlsWYKdG/wlw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/5] thermal/drivers/loongson2: Correct thermal
 sensor registration loop
Reply-To: sashiko-reviews@lists.linux.dev
To: "Binbin Zhou" <zhoubinbin@loongson.cn>
Cc: mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, lee@kernel.org
In-Reply-To: <367a07d2190203b2412d13f407eea81334122e31.1785480242.git.zhoubinbin@loongson.cn>
References: <cover.1785480242.git.zhoubinbin@loongson.cn>
 <367a07d2190203b2412d13f407eea81334122e31.1785480242.git.zhoubinbin@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 09:50:59 +0000
Message-Id: <20260731095100.372391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> The registration loop in loongson2_thermal_probe() incorrectly uses
> dev_err_probe() when the sensor is not present (-ENODEV). In that case,
> the driver should continue to the next sensor index rather than treating
> it as a fatal error.
>=20
> Fix this by correctly handling -ENODEV and only returning on other
> errors. Also add a final check to ensure at least one thermal zone was
> registered.
>=20
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/cover.1783670011.git.zhoubinbin@lo=
ongson.cn?part=3D2
> Fixes: e7e3a7c35791 ("thermal/drivers/loongson-2: Add thermal management =
support")
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1785480242.gi=
t.zhoubinbin@loongson.cn?part=3D1

