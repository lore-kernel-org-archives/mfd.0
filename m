Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E30944605C
	for <mfd@lists.linux.dev>; Fri,  4 Sep 2026 10:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788518945; cv=none; b=JYuZYbUCWodYrIeeaEVTIiWrC5wRg+KS1chAoZh8mQ7hhSgZFd025pwjwLNN+mAabRkyA/N24JGVtc0ROyuiA3ZG0SjYuKYtKOoDpATnX3AqIkHpGn/8gqoauSeiSlTEXz9iBPKy6TyDYYZ9lCFDM5Q0IDWgh73UXNrrSVh4EQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788518945; c=relaxed/simple;
	bh=lstsuMnNQJsRuPTxGC//gNInGBe8Vnf56Yhl2NiGI3U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=InbRZLqLH8NDiEE5KSkbo6/phngS0JVsuVNSCphkTPoo6MfxCfq3jMO6YBFLvAXejNRNJl1ZwBe8asoh3r5bMs7LBn29aOfrr1hy5kjSvsjV7rkY0qYvBhtoLCvoZCE1K/gIy/RDtq6sQY7qTeQzqV3P8gJl38lOaJTxFkO9lFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+fSKglV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+fSKglV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ACC31F00A3D;
	Fri,  4 Sep 2026 10:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788518943;
	bh=v3z1QiAeqQJYFTLFEqW/RKXED8ZfPpO5bZBTe8nVQTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O+fSKglVHFm6sk8BgVGP4jqK84pbRtoB/CEEXCkjqk+9L6PvP21ibxCTlXX5GYHGX
	 X0NXPF0pBSvIqM1JJGIctcNHreR557ANn/OSZeZlqxiytcnmA0nU0J2dBJRVp1Yha5
	 IdxzhYzmOoO6Dhke0alf9RfCjbdv4QC9rLXgnHJlmVffDZmXLOfVRoe6p9rCfFThg6
	 VryWmNLgsPhu4hpvs/cGRmdMP3mfjAMjL3Gn9p+eMj7emmXgiYBHP1O8+7UajrQzym
	 fHd5Gi6DjLdUva+uK/GlV/m45+rWvh/5ivIgI5Uczdsw8zDejKtu1zfjg6IJad+pHc
	 Ts6nrPlQluPnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: cs42l43: Move cancel_work_sync() into remove
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260904103925.292708-1-ckeepax@opensource.cirrus.com>
References: <20260904103925.292708-1-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 10:49:03 +0000
Message-Id: <20260904104903.8ACC31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Double pm_runtime_put_sync() call leading to usage counter underfl=
ow when boot_work fails early.
--

commit 2dc71c160f47bf4867fee4856b9a979eea19562c
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

mfd: cs42l43: Move cancel_work_sync() into remove

This commit moves the synchronization of the boot_work item out of devres
cleanup and into a dedicated remove function. It also adds a heuristic check
to drop the runtime PM reference taken during probe if the work never ran.

> diff --git a/drivers/mfd/cs42l43.c b/drivers/mfd/cs42l43.c
> index 039754e6eaa09..480447bc80ed9 100644
> --- a/drivers/mfd/cs42l43.c
> +++ b/drivers/mfd/cs42l43.c
[ ... ]
> @@ -1100,14 +1100,22 @@ static int cs42l43_power_down(struct cs42l43 *cs4=
2l43)
[ ... ]
> -static void cs42l43_dev_remove(void *data)
> +static void cs42l43_dev_power_down(void *data)
>  {
>  	struct cs42l43 *cs42l43 =3D data;
> =20
> +	cs42l43_power_down(cs42l43);
> +}
> +
> +void cs42l43_dev_remove(struct cs42l43 *cs42l43)
> +{
>  	cancel_work_sync(&cs42l43->boot_work);
> =20
> -	cs42l43_power_down(cs42l43);
> +	/* If the work never ran drop the pm_runtime reference from probe. */
> +	if (!cs42l43->irq_chip.irq_drv_data)
> +		pm_runtime_put_sync(cs42l43->dev);

[Severity: High]
Can this heuristic cause a double pm_runtime_put_sync() call if the work
executes but fails early?

If cs42l43_boot_work() runs but hits an early failure (for instance, a time=
out
or a device ID mismatch), the error path in the work item already handles
dropping the PM reference and exits:

drivers/mfd/cs42l43.c:cs42l43_boot_work() {
    ...
err:
    pm_runtime_put_sync(cs42l43->dev);
}

Because the work failed early, cs42l43->irq_chip.irq_drv_data remains NULL.

If the driver is later unbound, cs42l43_dev_remove() will run.
cancel_work_sync() will complete successfully since the work already finish=
ed,
and this heuristic (!cs42l43->irq_chip.irq_drv_data) will evaluate to true.

Will this incorrectly drop the PM runtime reference a second time,
causing a usage counter underflow?

>  }
> +EXPORT_SYMBOL_NS_GPL(cs42l43_dev_remove, "MFD_CS42L43");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904103925.2927=
08-1-ckeepax@opensource.cirrus.com?part=3D1
