Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2558939D6CA
	for <mfd@lists.linux.dev>; Mon, 31 Aug 2026 12:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788177830; cv=none; b=sBvVFBOXk6fgLnPjbVusJapWhbfbNpuSVbqLhOsl/mxNTYqIhGwX096Xais/DNgcNRXI6GRILPz1wYql8OZ872GXsXlWR+/do9JcDj6niam7EjtQYwOYVT3IdP9yNqBmK72rU9tVhYX6Uey/6NlIFNAOAsd2NimUv10wGwQbR3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788177830; c=relaxed/simple;
	bh=rVkFfBurGNkGKpWvAfPAjSOPnPO9A4uhmtBIsLcwcSA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HhQ1sJ7IBgleQ6BrX7OyghhrT5biBP/nuzdvT9ojQhOv3if7w+r0OArZacNeW0FSZGC0qemBx3E+Hnk9yB3In5YKyHbeemolJ3JZwSGE9NOILwwUvX4EG/vggSDF7O+Ipfv+85ImPP9wyZODW281dAsyMI77t3NkSUShw/H5xys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/n+Vgyd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/n+Vgyd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3241F00A3D;
	Mon, 31 Aug 2026 12:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788177828;
	bh=+BWRkWwFhpJ+DTaYSIaqS3CPKByOKtMmhR5613wQ634=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y/n+Vgyd29PLuKWym+2m98lZvXgMpflxHuvgZNPJu5Qy2Y7aqheb4iR1JN3YKu+m6
	 OcJ8artV3yhkWcQgiSq2RCOqVAwJf/acQmLi2vcT57Y6OVdastmsIG9Z6bP8QaMnN0
	 BYZlHYXEwsWMIzBMj6qqHXemMnRUyj8nTK4m72RY1oTcyLzPIrYu7MbtCEW1htDLb2
	 QkX/oQS04BLW40/aTRwWXoTQx8kopVRKDZjg1oGMzLLlA2xGabooBhE/VYxYvaHxiv
	 J6BDe+j91J1PDpscjCp/Ir3mzhakGKM4I+iNgbtP41+FrxKGtqZ870XTJjRjO8N/x6
	 s+65ec5giw45A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] soundwire: Add a helper function to indicate a
 device will detach
Reply-To: sashiko-reviews@lists.linux.dev
To: "Charles Keepax" <ckeepax@opensource.cirrus.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260831115019.1616202-2-ckeepax@opensource.cirrus.com>
References: <20260831115019.1616202-1-ckeepax@opensource.cirrus.com>
 <20260831115019.1616202-2-ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 12:03:47 +0000
Message-Id: <20260831120348.7F3241F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] sdw_slave_signal_unattach() fails to update slave->status to SDW_S=
LAVE_UNATTACHED, which can deadlock the SoundWire enumeration state machine=
 if the transient hardware detach is missed.
- [Low] The kernel-doc comment for sdw_slave_signal_unattach() describes a =
non-existent parameter and an incorrect return value.
--

commit b3922d4aabf3e57f2fd4348625745b06244e4fe8
Author: Charles Keepax <ckeepax@opensource.cirrus.com>

soundwire: Add a helper function to indicate a device will detach

This commit adds a helper function, sdw_slave_signal_unattach(), to indicate
when a SoundWire device is about to detach due to a reset. This ensures the
core reinitializes the completions so that sdw_slave_wait_for_init()
correctly waits for the device to reattach.

> diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
> index 707ca6bd1e23d..969604755ce41 100644
> --- a/include/linux/soundwire/sdw.h
> +++ b/include/linux/soundwire/sdw.h

[ ... ]

> +/**
> + * sdw_slave_signal_unattach - Signal that the peripheral is about to de=
tach
> + * @slave: Pointer to the SoundWire peripheral.
> + * @timeout_us: Timeout in microseconds.
> + *
> + * Inform the core that the peripheral is about to detach from the bus, =
this
> + * is usually due to some implementation defined reset mechanism. After =
this
> + * sdw_slave_wait_for_init() should be called to wait for the device to
> + * return.
> + *
> + * Return: Zero on success, and a negative error code on failure.
> + */

[Severity: Low]
This isn't a bug, but the kernel-doc comment describes a @timeout_us parame=
ter
and a return value that do not exist in the inline function signature. Could
these be removed to prevent kernel-doc warnings during W=3D1 builds?

> +static inline void sdw_slave_signal_unattach(struct sdw_slave *slave)
> +{
> +	if (!slave)
> +		return;
> +
> +	slave->unattach_request =3D SDW_UNATTACH_REQUEST_SLAVE_RESET;
> +	reinit_completion(&slave->enumeration_complete);
> +	reinit_completion(&slave->initialization_complete);

[Severity: High]
Does this function also need to update slave->status to SDW_SLAVE_UNATTACHE=
D?

If a transient hardware unattach is missed (e.g., due to interrupt coalesci=
ng
or scheduling delays), the core might see the device reattach as device 0.
When sdw_handle_slave_status() processes this, it calls
sdw_program_device_num() which checks if the status is SDW_SLAVE_UNATTACHED.

If slave->status is left as SDW_SLAVE_ATTACHED, sdw_program_device_num()
aborts without reprogramming the device ID. This leaves the device stuck on
device 0, failing enumeration and causing sdw_slave_wait_for_init() to time
out.

> +}
> +
>  /**
>   * sdw_slave_wait_for_init - Wait for device initialisation
>   * @slave: Pointer to the SoundWire peripheral.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831115019.1616=
202-1-ckeepax@opensource.cirrus.com?part=3D1
