Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120C233D9E
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 12:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177841; cv=none; b=A1V96iKOJ7sXC3DuSV3fAgqbMJKWoYyhPptIP6zYQ6BjCGtBMC2zRJ/f/sTzRNEr8xt7oJae4LS412G5GGqhruA1OK2e7z9Pg+24h8JwBODDXLEyLbnDmcZJQLE7eaO9O1IDSkQV+QT2jwMfEvqlepXvT4/aZ1Bl2ec0GBj9Tr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177841; c=relaxed/simple;
	bh=Ydn6einXAz6KuVHAfoAmWzZIv+jDL86QfleOuwYtz10=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dRlqtnP1UVuofg95gzLCR2x8TOYzLB33z1xzn+Ik0A7VDBnVXCpuNB8kph3G0yEpj/0qilrSuW3w0ItyPvutINSNPfA3O/KR7jRJTm/YlGJ0nqwtX0vRAo2WSOBoqLh6mf4R4aL997DY8U51YcBhj98Toxwg4+wdq45XTbAVOJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=orAKXZoN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="orAKXZoN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 676641F00A3D;
	Mon, 31 Aug 2026 12:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788177839;
	bh=prwwsf2q4nCUz2P5B/loSmfYt/ob3M+yCkGYEZKeQOk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=orAKXZoNeCYkdWh+1SWSTYRzWSXhg4iyO3MGjRUUxgSPIzXtj0iQHj+OF9JwQ0w0c
	 tkGmFswABLUeqsvQi5XIpNQNqRRKDVIn3rNPuhcxpILkrfShVMOdedUoub/VUtbh1z
	 UfYYSOuyTFP0XOSlplvuqbcUxdL5+3Gzy98sqxfIGJ6sSSTBKTrIFH2f9CyCauyqsC
	 9GQCCTx+MsrrxgpybiZ8uB/nahvhE7ycQqJC7sms92X/C/SKAMQdgoGUIwrWRB2auN
	 CVveHekmPCzjzrnLaEhGhB5g5h5WHGARQevSFjva9YKDw5hYRSSHbllu8XlXrbaCIn
	 2OLZuYRdw1qrA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mfd: cs42l43: Move to core detach helper
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260831115019.1616202-3-ckeepax@opensource.cirrus.com>
References: <20260831115019.1616202-1-ckeepax@opensource.cirrus.com>
 <20260831115019.1616202-3-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:03:59 +0000
Message-Id: <20260831120359.676641F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting lifecycle bug: Devres items added by an asynchronous w=
orkqueue after devm teardown has started are permanently leaked.
--

commit 28cea6eee264ba4b58e5dad35cea9b520bc94140
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

mfd: cs42l43: Move to core detach helper

This commit switches the cs42l43 driver to use a new SoundWire core helper=
=20
for tracking device detachments instead of tracking it internally. It remov=
es=20
the custom device_detach completion.

> diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
> index 4212ebcca60b5..f08ee598366d9 100644
> --- a/drivers/mfd/cs42l43.c
> +++ b/drivers/mfd/cs42l43.c
[ ... ]
> @@ -1115,7 +1103,6 @@ int cs42l43_dev_probe(struct cs42l43 *cs42l43)
>  	dev_set_drvdata(cs42l43->dev, cs42l43);
> =20
>  	mutex_init(&cs42l43->pll_lock);
> -	init_completion(&cs42l43->device_detach);
>  	init_completion(&cs42l43->firmware_download);
>  	INIT_WORK(&cs42l43->boot_work, cs42l43_boot_work);

[Severity: High]
This is a pre-existing issue, but is there a potential lifecycle memory lea=
k=20
and use-after-free here regarding the asynchronous boot_work?

Later in cs42l43_dev_probe(), cs42l43_dev_remove() is registered as a devm=
=20
action via devm_add_action_or_reset(). If the driver is unbound shortly aft=
er=20
probe (e.g., via sysfs unbind or device hot-unplug), the devm teardown will=
=20
run and execute cs42l43_dev_remove(), which calls=20
cancel_work_sync(&cs42l43->boot_work).=20

If cs42l43_boot_work() is concurrently running, cancel_work_sync() will=20
block. Inside the work, devm_mfd_add_devices() is called, which adds new=20
devres items to the device. Because devres_release_all() is already=20
iterating over its captured list of items during the unbind, these newly=20
added devm actions are skipped and permanently leaked.

This leaves the MFD child devices registered with pointers to a freed paren=
t=20
cs42l43 structure, which could result in a use-after-free if those children=
=20
access their parent data.=20

Should the boot_work synchronization be moved out of the devres teardown pa=
th=20
so it executes before devres_release_all() captures the release list?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831115019.1616=
202-1-ckeepax@opensource.cirrus.com?part=3D2
