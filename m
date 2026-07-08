Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A813C109D
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510007; cv=none; b=jmbZY/QtTOz5Bz+YXiFjITS8t/Jeb8Rxh3K7n0XHu9c7ZB4Fvda+QQIzofqcIJObwwtCX+kEeDtWMJQSX/VWz6xovtwSqjpJk1ykZgDcAMBiLm0nK+Xutid6ha3yEi/SniLF5ShpHapQXj6lVEFMEfxO4gXK2Hd0MXD7yie4/r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510007; c=relaxed/simple;
	bh=rMyF8TExeIigfoaZBjhz+wnUC9oaWDTdSlQ5xQ8WZeI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QYVtwQuS+YB5R+dUdHh4Ad1nD6lDVdjKSv1LUKJbyJ6u20oNiKRDmWXtdNwrCevMHzivz5Jb0YR99jfpp0FMO0XwBWfM4ehHF9wXJmHaTQ94w9f+C80N/OpxHL27eT6R7v9dmTo25GCTwuHt4kl9yaqLFkMUFAGI5ZnaWT7fy4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dbBaWApE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dbBaWApE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B4991F000E9;
	Wed,  8 Jul 2026 11:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510005;
	bh=rMyF8TExeIigfoaZBjhz+wnUC9oaWDTdSlQ5xQ8WZeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dbBaWApEwX6OPJF1YdKxsytMNVpyU6wD8zC0p8swe2qWJzcfYaHSU2e6YajfehM+B
	 SnvFcvLMT+XLEm48gE/+H8m/oP3LObFFo7TjXI03T1zqirYfmT+xvRdqTI8R69Q5u8
	 559ULRGTriTouba9zutuklO0HEv/3NhUfcjU0PYgZ2dOvJtB/U5zx617pV3hIDcn+o
	 dWKb47AD1B9x5EKm3m/tivKxCAzq9O9WQRf+pGByR/az1P3kcenELCMMqXKe3a0aTD
	 maa4c5Dmj/4O0FkZDXQ1CgKdDRSHOJ93n58QQDYBY2uPO3IMs5lBPn5QjxBNjnsags
	 Q15VynUZNRavw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/23] mfd: bcm2835-pm: Remove member of struct
 bcm2835_pm that is only used locally
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <d80395cc8008817427e63417b97bc8631236c72a.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <d80395cc8008817427e63417b97bc8631236c72a.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:26:45 +0000
Message-Id: <20260708112645.7B4991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> struct bcm2835_pm::soc is only used in bcm2835_pm_probe() and thus can be
> replaced by a local variable.
>=20
> With that change enum bcm2835_soc is only used in the mfd core driver and
> so the definition can move there.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D1

