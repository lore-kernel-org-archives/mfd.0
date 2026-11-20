Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795204293;
	b=KSHmPNY4vgp1VGdFuYJ+xPVXc7vqrtFrWmaAqx33Rd4bmwOdENre6711GbVx190ctAwv
	 b59UNBQaPOkHR+K5q5RZv47TWojQuVaUXwV5KYmC4av0QrEmo2SJdyGkjouICCHuWvga/
	 5tvS6ddR8/VsroLf5JD9qKSj/yeqDEaQGITAQaOPGce8X92CaVyIhwfw2HpW6YzBxh7Lt
	 /fRzmycd34LIwqtZj1E24AaJT2nmU5G4TUyiVzidrDnfGsVUesUuXXWgkLeSnSjQz6bcP
	 Ya0zODWPSgV+R3GWIOS31z4uzH6LLTj+ddVY99Hy1FAG74qpta+hBWv9c4EfDnwdyVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795204293;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=tOB4l80V9TFbQI02qDkKkXDt7nkgkAi8I6tdnu19nho=;
	b=1VOJ0wVmMH6C0wYJ9BxxRZuTIP8ut8yD/tsQHHLxkH+ibiw682TFLgyZRy+SIGnuNOTI
	 T70BXnX8eo3jOogfZPSbm7kZeRhEyVMPkHUi2y2MKTgcr+ZluTaAPl0npBgjFUbk1mT6x
	 wduyHm6Ry6ZBTl3OOG2Qjz6ib/qWj6ABBXwmcMOFeEFElB2J+Yun4rVVeKKx4dSa+yY9v
	 czmqbAxN4y5+65ELQoHy1EgIPqvOO4OA9u068AFVJjApGnN9ydpe45ccoYcjuz1grDZ+u
	 l8O8bDJ6vHPC611jthCriSSn5/uq/VziA8FLfWYWAGc3ctLh5vdlfCQOOIMAgSk0zmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UbPe1MBa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B30606A6C9;
	Fri, 20 Nov 2026 19:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UbPe1MBa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFB71F000E6;
	Fri, 20 Nov 2026 19:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795204292;
	bh=tOB4l80V9TFbQI02qDkKkXDt7nkgkAi8I6tdnu19nho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UbPe1MBaowHN0HV2748sbZkosOY5sp4BtGOMIXf/ohUdci22v1RoW3xtDxXssBVRz
	 A690F6e6D2X405UQS+aTyb08Gl6msGd/MSfAmJmHaqmkJ+40GCwucsZc47dLsXX+OF
	 0FHWcoR6lFjQosq6SsmLb2rtWBbHgREb+2gCotTBxU0aGHdhcUC8hhlZ9yDiLtHBFL
	 iVeMaIp0ycNSZtdxQXP/HElxDaJ37GS7CTd/C5/T13BEcjpW5vpi0fCMW0ht+jgssH
	 AV7dV+3JqfYZpwXiOHqwMsugmFdz/sXAIc5bqEO4gBy87U3YNt1gkZHRyRrnkKCGA1
	 Mt7yJ14gM9mOg==
Message-ID: <sashiko-outbox-225964@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/6] pmdomain: zte: Add a zx297520v3 power domain driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, lee@kernel.org
In-Reply-To: <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
References: <20261120-zx29usb-v1-0-b0433258e51b@gmail.com>
 <20261120-zx29usb-v1-3-b0433258e51b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 19:51:31 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] pmdomain: zte: child-to-parent device link deadlock in
  zx29_pd_probe()
- [High] pmdomain: zte: wrong supplier device in zx29_pd_attach_dev()
  device link
--

commit 65d36c75a56ee45de3b21629f8434fb30bf2339b
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

pmdomain: zte: Add a zx297520v3 power domain driver

This commit adds a power domain driver for the ZTE zx297520v3 SoC to
control the power, reset, and bus isolation registers for the USB
controller.

> diff --git a/drivers/pmdomain/zte/zx297520v3-pm-domain.c b/drivers/pmdoma=
in/zte/zx297520v3-pm-domain.c
> new file mode 100644
> index 0000000000000..3df4cd5f1b229
> --- /dev/null
> +++ b/drivers/pmdomain/zte/zx297520v3-pm-domain.c

[ ... ]

> +static int zx29_pd_attach_dev(struct generic_pm_domain *domain, struct d=
evice *dev)
> +{
> +	/* The DT link to the consumer targets the (MFD) parent, which doesn't =
prevent unbinding the
> +	 * this driver or removing the module. Either would leave the consumer =
with a dangling
> +	 * reference.
> +	 */
> +	if (!device_link_add(dev, &domain->dev, DL_FLAG_AUTOREMOVE_CONSUMER))
> +		return -ENOMEM;
> +
> +	return 0;
> +}

[Severity: High]
Should the device link supplier here be the zx297520v3-socsys-power
platform device (&pdev->dev) rather than &domain->dev?

&domain->dev is the internal genpd provider device deleted by
of_genpd_del_provider().  Because no consumer link targets &pdev->dev,
unbinding this driver starts devres teardown while consumers are still
bound and only unbinds them inside zx29_pd_release_provider() ->
of_genpd_del_provider() -> device_del(&gpd->dev) under gpd_list_lock and
of_genpd_mutex.

That inverts the normal lock order against a probing consumer that already
holds device_lock(consumer) while calling dev_pm_domain_attach() ->
genpd_dev_pm_attach():

CPU0                              CPU1
----                              ----
lock(&consumer->mutex)
                                  lock(&gpd_list_lock)
                                  lock(&of_genpd_mutex)
lock(&gpd_list_lock)
                                  lock(&consumer->mutex)

 *** DEADLOCK ***

CPU0: really_probe(consumer) -> ... -> genpd_get_from_provider()
CPU1: zx29_pd_release_provider() -> of_genpd_del_provider() ->
      device_del(&gpd->dev) -> ... -> device_links_unbind_consumers()

In addition, if a consumer attaches via genpd_dev_pm_attach_by_id() or
genpd_dev_pm_attach_by_name(), dev is a driverless virtual device on
genpd_bus_type, so its link to &domain->dev stays in DL_STATE_AVAILABLE:
device_links_unbind_consumers() never detaches it,
device_links_driver_cleanup() hits WARN_ON(), and pm_genpd_remove() fails
with -EBUSY right before devres frees zx29_pd, leaving a freed
generic_pm_domain on gpd_list.

[ ... ]

> +static int zx29_pd_probe(struct platform_device *pdev)
> +{

[ ... ]

> +	res =3D of_genpd_add_provider_onecell(of_node, zx29_pd_data);
> +	if (res)
> +		return dev_err_probe(dev, res, "Cannot register power domains\n");
> +
> +	device_link_add(dev, dev->parent, DL_FLAG_AUTOREMOVE_CONSUMER);
> +
> +	dev_dbg(dev, "zx297520v3 power domain initialized.\n");
> +
> +	return devm_add_action_or_reset(dev, zx29_pd_release_provider, of_node);
> +}

[Severity: High]
Can adding a managed device link from dev to dev->parent deadlock when
zx297520v3_crm_probe() registers its MFD children after late_initcall
(for example on module load or driver rebind)?

zx297520v3_crm_probe() calls devm_mfd_add_devices() while really_probe()
holds device_lock(dev->parent).  Because of_genpd_add_provider_onecell()
sets genpd_sync_state on dev->parent, finishing dev's probe queues
sync_state on dev->parent and tries to lock dev->parent again on the same
thread:

really_probe(dev->parent)
  device_lock(dev->parent)
  zx297520v3_crm_probe()
    devm_mfd_add_devices()
      ...
        really_probe(dev)
          zx29_pd_probe()
            of_genpd_add_provider_onecell(dev->parent->of_node, ...)
            device_link_add(dev, dev->parent, DL_FLAG_AUTOREMOVE_CONSUMER)
          driver_bound(dev)
            device_links_driver_bound(dev)
              device_links_flush_sync_list(..., dev)
                device_lock(dev->parent)  <-- self-deadlock

Since dev is a child device registered via devm_mfd_add_devices() on
dev->parent, the driver core already orders suspend/resume and removes dev
when dev->parent unbinds without this link.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-zx29usb-v1=
-0-b0433258e51b@gmail.com?part=3D3
