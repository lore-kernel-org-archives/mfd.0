Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EAAE37881F;
	Mon,  3 Aug 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785751670; cv=none; b=l5OJSaXUKxltejp+jCS/QYEdchhgbpA8bdk8S1NWc6gwQEN6cHxYaLDeW5BsVlm1u/NRE1Xziyo+DCy/Kr9SojGxa44JyrrkbQHiz5dzBnmXYalJZWBpk/jTYE23Aioey07KPSJnTQ6MJBsvby+zcXOFcXr5kLIC3gD8iCqMX5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785751670; c=relaxed/simple;
	bh=SoqayYByhUL89n/ShdYR1Y7paGZeh1P50jpCuvew4pg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H/0DsJ9o7Xd7dEG2hEmOCTRov4JmWDdsFef9EeSkpayn9bf5hoh4H5FDTIVfzEqRM+eKtnyu6BQY+IzpeCOKjuY0nYwIahA65oDAQ2qAf9fbQeveuCgv0W0+nHq0mFucc9QB+OdtzvuHPAMn5nlsJw/5gRSWPMb2xzMSVbarKRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbA13qTT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbA13qTT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34BE81F000E9;
	Mon,  3 Aug 2026 10:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785751668;
	bh=+4zXPvU5hR6rI+aJ6xPAJ/NX0K947JAZCElYRRq5B9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QbA13qTTpDtlurQeCslUuSB5XXtXC/oReFSqi0QKcYMuyeOXmIUmPTHI+SJmWLJzZ
	 2Sj5ZvUPZbRyigDQx3VO+rVm1C9mF9cCY6BX+RSfm9vi0ZIfKAHAz6kSzH5z9OMJ8Y
	 7Yl1J/8D5EV4Mx96FEu6X0/EnIWRz5XuwTvtXjfvEtOuFpkmbzSRLPLv4Psj9LBLTz
	 Gv3AcvyRZpPQIW32uLN7Ht7ETm/3Ehs7COOap3Rc92FnmroSmufQ3yUTem8W05rPin
	 DS70iROG7TLV+zVCQQ1XMLS7XX0fqQMLTzBH1tY4uSQ7Xhe2rTAfWupeSCfYurwdes
	 wMEjBIyKfH6SQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child
 cell
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shivendra Pratap" <shivendra.pratap@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, lee@kernel.org
In-Reply-To: <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-8-889281373870@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 10:07:47 +0000
Message-Id: <20260803100748.34BE81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The MFD probe function swallows errors from devm_mfd_add_devices=
() instead of propagating them to abort the probe.
--

--- Patch [8]: [PATCH v24 08/12] mfd: psci-mfd: Add psci-reboot-mode child =
cell ---
commit 88cfe078ed8299db3dd71fd877f29ff443d5037e
Author: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>

mfd: psci-mfd: Add psci-reboot-mode child cell
   =20
This commit exposes the PSCI reboot-mode node as a proper child cell using
a named_fwnode. It also registers the psci-cpuidle-domain cell first to
isolate it from reboot-mode failures.

> diff --git a/drivers/mfd/psci-mfd.c b/drivers/mfd/psci-mfd.c
> index 7affd6bb09dd8..7befc4fa86f5d 100644
> --- a/drivers/mfd/psci-mfd.c
> +++ b/drivers/mfd/psci-mfd.c

[ ... ]

> @@ -14,10 +14,35 @@ static const struct mfd_cell psci_cells[] =3D {
>  static int psci_mfd_probe(struct platform_device *pdev)
>  {
> -	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cells,
> +	int ret;
> +
> +	ret =3D devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO, psci_cell=
s,
>  				   ARRAY_SIZE(psci_cells), NULL, 0, NULL);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				   psci_reboot_mode_cell,
> +				   ARRAY_SIZE(psci_reboot_mode_cell),
> +				   NULL, 0, NULL);
> +	if (ret) {
> +		if (ret =3D=3D -ENOMEM)
> +			goto out;
> +		dev_warn(&pdev->dev, "reboot-mode child cell failed to add: %d\n", ret=
);
> +		ret =3D 0;
> +	}

[Severity: Medium]
Should this propagate the error instead of returning 0?

According to the MFD subsystem guidelines, if a child device fails to
register during an MFD probe, the entire probe must fail and unwind
previously registered children. By setting ret =3D 0 here, the driver repor=
ts
success for the parent probe even if the reboot-mode child cell fails to
register. Does this leave the device in an incomplete state and violate the
requirement to propagate devm_mfd_add_devices() errors?

> +
> +out:
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260803-arm-psci-s=
ystem_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com?part=3D8
