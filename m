Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AA5395AE9
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 10:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505812; cv=none; b=P2PDP7S6X8xqpkpoyGcEjKsjEcFq3oQ0K2qQj9DmvT3RG7AaN+1H/p8RJ0f5MA0VRrLUygnfw0jfr8XSxTXhRQqY9KBibRe1CdJne/lBsZjItjeH+LYcTh4TuZfTpl2LRI7Hk+UQaNkn2k8IywyCSyQvAX3vdSY3TeIexbi87hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505812; c=relaxed/simple;
	bh=Todgq+pOpYlconYsqaxhC2YZ/uqTXsNbEFlCQ7eI8J8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gHL9nmjvYsnJfu6lE1vfvZiKcy2HXa8S4cuX/3d/DLdJemN9/OfTMfk0rHIuEic0odlCFtSVwa9msuu4nirehIqiLhGn2XwoQIvO8lNUgVjpkWoA2qL1RemZrcSSu/xMhvJ5VOTx+8hNURnyKpwcpKSaEUDZ5dj0Yxs+BmzsFB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jebmVWAB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jebmVWAB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE6931F00A3A;
	Wed,  8 Jul 2026 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783505811;
	bh=FyFasETHBJwjmbSsj+PS/WJsgvQOTzWaksWQcioIVW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jebmVWABhWVpgaxR22uKA6lK+0hpByk26FQMfapnFUwWlnuiuWH2f+dOfvuZF8Tzy
	 NAoYqlFwxZ31wWAOnMEqHTi1YQcA84lYeL/Mikg1f131U6CareZQh/s6VPwEoS4f25
	 YdkHO64yB533dxfjVHWmQ6eP4Hg2XG+WAK4AUoEUl0RWLGfihecrEbb7/dt+lgXAGa
	 l2XzVJNx72UevQNx8PNZtqsrCzh6WkTsqn6QmG0iS9ttjJt4/zg/9iBvJdt+aQt4zA
	 enAzZ9iKeNWH1XRTO00klo7jgjLhb2X2ZO4fpEhYaTIIqCp7Gf0VfJQvf89Hob5Zb+
	 AF5Mw9R7XX1ag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: cs42l43: Remove redundant NULL checks on SoundWire
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260708100914.1298080-1-ckeepax@opensource.cirrus.com>
References: <20260708100914.1298080-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:16:50 +0000
Message-Id: <20260708101650.BE6931F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but hard-coding MFD =
cell device IDs with PLATFORM_DEVID_NONE violates subsystem guidelines and =
can lead to sysfs naming collisions.
--

--- Patch [1]: [PATCH] mfd: cs42l43: Remove redundant NULL checks on SoundW=
ire ---
commit 19ffc73222838697334faab6f7e91a44c4692edc
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

mfd: cs42l43: Remove redundant NULL checks on SoundWire

The SoundWire core helpers now check for NULL on the SoundWire
peripheral so there is no need to do so locally, remove the
duplicate checks.

> diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
> index d2bbd2f18af7d..33479ddd539a6 100644
> --- a/drivers/mfd/cs42l43.c
> +++ b/drivers/mfd/cs42l43.c
> @@ -588,12 +588,9 @@ static int cs42l43_wait_for_attach(struct cs42l43 *c=
s42l43)
>  {
>  	int ret;
> =20
> -	if (cs42l43->sdw) {
> -		ret =3D sdw_slave_wait_for_init(cs42l43->sdw,
> -					      CS42L43_SDW_ATTACH_TIMEOUT_MS);
> -		if (ret)
> -			return ret;
> -	}
> +	ret =3D sdw_slave_wait_for_init(cs42l43->sdw, CS42L43_SDW_ATTACH_TIMEOU=
T_MS);
> +	if (ret)
> +		return ret;
> =20
>  	regcache_cache_only(cs42l43->regmap, false);

While reviewing this commit, I noticed a pre-existing issue in the same fil=
e:

drivers/mfd/cs42l43.c:cs42l43_boot_work() {
    ...
	ret =3D devm_mfd_add_devices(cs42l43->dev, PLATFORM_DEVID_NONE,
				   cs42l43_devs, ARRAY_SIZE(cs42l43_devs),
				   NULL, 0, NULL);
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but does the hard-coded
PLATFORM_DEVID_NONE here prevent automatic cell indexing?

If multiple CS42L43 devices are instantiated, the second instance's attempt=
 to
register its subdevices could cause a kobject naming collision on the platf=
orm
bus since there is no index.  Should this use PLATFORM_DEVID_AUTO instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708100914.1298=
080-1-ckeepax@opensource.cirrus.com?part=3D1
