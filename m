Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E65399889
	for <mfd@lists.linux.dev>; Thu,  9 Jul 2026 17:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617003; cv=none; b=lT4VSNV2VFlnKJw48PmqG3GWtJHHhjSVWOZriCe44cb+3wNSg4xzKqDu0kCZNgiqhHbKV5ILC8rmPqC52o7REO/QwiS5xUqnPzXSDsKk97ERjEUPqpSZ1pFnjeOgTfFmItdXsGCkmRRW9zpUrDQfLoXyZSPVShfCWqUCIb2hL2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617003; c=relaxed/simple;
	bh=A85IekBpoNAtVhjBiUTNQP8II/bfbFh1aDSsQCsxzQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S/F4LsvwgiqfR4PUd3TNlaU6ffG3OuOniSZuwP5vFRKWN6bjYOpGtsKNO4L5foL69tQ7cBOifpgZb11njvd5tB1KvKIYmJprudu5NJgwim/VnzAkJciMyGpb7cIzot5pwIkhnEy2JSlUrjYv9+KwvDmx5tKqVDNRnGiiVF8yoFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jLgTo6X6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jLgTo6X6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 219421F00A3D;
	Thu,  9 Jul 2026 17:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617002;
	bh=u3hqbcNgQvxsRmx6XslBGA7fudJOo8/PKTXiqDnLsH8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jLgTo6X6z4Ow+oQCtOl2kA6/DP/n+hVnRtOJtpPG/FrYyVRvxIPNyoNbkNf/OCZl/
	 Z9JnWpv7lvliH7GbHhG3eu4JZR7a6hfro2Yc8y0CMLVXIF3bZEsg8+pPXACPe7K6QI
	 VILx5bYc8r7JqxY2npCW5BiWK3HGQxuR6bGVC+2d1fR8td+SNKM8oWn2i1FoFfDAoE
	 wPqsimGJEIkDj27uJOqFa5yvdFNlggYgrwWyRibND/Jwd0t2qVEvTzbCd8PBltnZdD
	 jMBa1gLAuEM237BtQfzBYzJX2XjivHvPD147txsoQ/cVhsVmwrZe/oQ+Pt5bMgss01
	 GllcAEYHFnozA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 12/23] mfd: intel-m10-bmc-pmci: Use named
 initializers for dfl_device_id array
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <33ec4337624f50d718499d77a8481a6010fe7a7f.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <33ec4337624f50d718499d77a8481a6010fe7a7f.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:10:01 +0000
Message-Id: <20260709171002.219421F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Silent data truncation in flash bulk read and write functions when=
 size is not a multiple of the FIFO word size.
--

--- Patch [12]: [PATCH v3 12/23] mfd: intel-m10-bmc-pmci: Use named initial=
izers for dfl_device_id array ---
commit c4097d9e7190ea25ca27dcc35181e73867cc426b
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id array

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
dfl_device_id that replaces .driver_data by an anonymous union.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

> diff --git a/drivers/mfd/intel-m10-bmc-pmci.c b/drivers/mfd/intel-m10-bmc=
-pmci.c
> index d213c6ec04bad..f78309bbabfdb 100644
> --- a/drivers/mfd/intel-m10-bmc-pmci.c
> +++ b/drivers/mfd/intel-m10-bmc-pmci.c
> @@ -434,7 +434,7 @@ static void m10bmc_pmci_remove(struct dfl_device *dde=
v)
>  #define FME_FEATURE_ID_M10BMC_PMCI	0x12
> =20
>  static const struct dfl_device_id m10bmc_pmci_ids[] =3D {
> -	{ FME_ID, FME_FEATURE_ID_M10BMC_PMCI },
> +	{ .type =3D FME_ID, .feature_id =3D FME_FEATURE_ID_M10BMC_PMCI },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(dfl, m10bmc_pmci_ids);

[Severity: High]
This is a pre-existing issue, but does pmci_flash_bulk_write() silently
truncate data when the size is not a multiple of the FIFO word size?

Looking at pmci_flash_bulk_write() in drivers/mfd/intel-m10-bmc-pmci.c:

	while (size) {
		blk_size =3D min(pmci_get_write_space(pmci), size);
		...
		write_count =3D blk_size / M10BMC_N6000_FIFO_WORD_SIZE;
		pmci_write_fifo(pmci->base + M10BMC_N6000_FLASH_FIFO,
				(u32 *)(buf + offset), write_count);

		size -=3D blk_size;
		offset +=3D blk_size;
	}

	/* Handle remainder (less than M10BMC_N6000_FIFO_WORD_SIZE bytes) */
	if (size) {
		...
	}

If size is not a multiple of M10BMC_N6000_FIFO_WORD_SIZE, blk_size will be
subtracted from size, causing size to prematurely drop to zero. Will this
bypass the remainder block handling entirely and skip writing the trailing
bytes?

A similar truncation appears to happen in pmci_flash_bulk_read():

		pmci_read_fifo(pmci->base + M10BMC_N6000_FLASH_FIFO,
			       (u32 *)(buf + offset), full_read_count);

		size -=3D blk_size;
		offset +=3D blk_size;

		if (full_read_count < read_count)
			break;

Since size -=3D blk_size reduces size to zero before breaking from the loop,
does it cause the remainder logic at the end of the function to be bypassed
as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D12
