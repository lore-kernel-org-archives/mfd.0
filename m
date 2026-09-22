Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2362B4052A4;
	Tue, 22 Sep 2026 10:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074445; cv=none; b=feXEmcnSpEf/qxbxg5ds32GfllEgM2GPR1LTpe7vPthCto1T4fBztZ1BYkBNeXE3XpFjmDHruBtls79b2LxLvjMV8M1JDQaEmdcEkZkBJnIy9DcyqC2y2TUBRIG0wkig1fO7UUhBx/x/CjgXnfMPgKes+DHYMt6eQmgLe4ITS7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074445; c=relaxed/simple;
	bh=22Rv0SGJY0dN5MjFkSSjHICF8Z/PEEu4kXk6WovqR0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NZvpiV3wFv8ObuMiFNzIUiMRrKfRnQ6iei90c3GFpYmqugXUHImc6FZGJgOfbeOkTcA2XN2GsRJu6vC1Jk0XoZ8UjQueYtccRsSkRyUQjzvEr9grPrY8tlA47x0kbOWU1NDNYr0Wl4iYLffbmip/m1rkIlrhhBBSlMJiK7PMiM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fT8BFfzX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fT8BFfzX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABFF1F00893;
	Tue, 22 Sep 2026 10:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790074438;
	bh=riCH2xQeou67pdAof+xjMVRgwfKowBYXjXWeRpybbYA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fT8BFfzXtvBTSdLUjSZQFAYdS+uWS9zSq9XVo571uFMT8/bZ8SLo+3OK6M53vQQQp
	 dbH4AZI88pJExhEdpC/7P6LUQmiZJ9mALcr8LcnupiOdenel8Fyy0NmogBAly6gIOk
	 IJXG7sdPsxWmq4x1emvzSRlqmxdvQm+21PFq//LbMvFRRQYSvo+DHpwbAK7HGRLmXb
	 wJJmTsC+Lidqdv+vhsNve8OhN90z3IPHDHu/+3ah1xjFHtFZBgpgJnfaDTrEeGih6I
	 pevT0+fVWzVxSZhz6dzMeFOU6qYcS43qU8KrCjS4qI+C8YzUWBD7pruUg95u7M1fFq
	 b4ebKE+h5kWtA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v20 6/8] i3c: hub: Add support for the I3C interface in
 the I3C hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260922103551.2754613-7-lakshay.piplani@nxp.com>
References: <20260922103551.2754613-1-lakshay.piplani@nxp.com>
 <20260922103551.2754613-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 22 Sep 2026 10:53:56 +0000
Message-Id: <20260922105357.5ABFF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] i3c: hub: ENTDAA-discovered downstream devices are misrouted to pa=
rent bus
--

commit bf3909722bdabc30e1d69d666d5732199356fb61
Author: Lakshay Piplani <lakshay.piplani@nxp.com>

i3c: hub: Add support for the I3C interface in the I3C hub

This commit adds virtual I3C bus support for hubs by creating virtual
master controllers for downstream ports and forwarding bus operations
through the hub device.

> diff --git a/drivers/i3c/hub.c b/drivers/i3c/hub.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/i3c/hub.c
[ ... ]
> +static int i3c_hub_do_daa(struct i3c_hub *hub,
> +			  struct i3c_master_controller *controller)
> +{
> +	struct i3c_master_controller *parent;
> +	int ret;
[ ... ]
> +	mutex_lock(&hub->lock);
> +	i3c_hub_enable_port(controller);
> +
> +	/*
> +	 * Downstream devices reachable through hub target-port routes share the
> +	 * parent controller's I3C address space. The hub gates access to a
> +	 * target-port network, but it does not create an independent dynamic
> +	 * address domain per virtual bus.
> +	 *
> +	 * Run DAA on the parent controller so dynamic addresses remain unique
> +	 * across all downstream devices, even when they are behind different
> +	 * target ports.
> +	 *
> +	 * The current hub model shares the parent controller's dynamic-address
> +	 * domain and does not support independent per-port DAA domains, so a
> +	 * DAA result does not go stale behind a port toggle. Addresses reserved
> +	 * from the Device Tree are held for the lifetime of the parent bus and
> +	 * are never released on a port toggle, so enabling or disabling a port
> +	 * only gates reachability and never causes an address to be handed out
> +	 * twice.
> +	 */
> +	ret =3D i3c_master_do_daa(parent);

[Severity: High]
Does delegating DAA to the parent controller here misroute newly discovered
downstream devices?

When i3c_master_do_daa() executes ENTDAA on the parent controller, any
downstream I3C device lacking a static address will be assigned an address
and added directly to the physical parent's bus.devs.i3c list instead of
the virtual hub bus.

Because these devices are attached directly to the parent, won't their
subsequent transfers bypass the virtual controller's priv_xfers routing?
If so, the hub port would never be enabled during normal communication,
causing all transfers to the device to fail with a NACK or timeout.

> +	i3c_hub_disable_port(controller);
> +	mutex_unlock(&hub->lock);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922103551.2754=
613-1-lakshay.piplani@nxp.com?part=3D6
