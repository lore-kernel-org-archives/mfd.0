Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945A742B30F
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 11:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510208; cv=none; b=YyMc15vX7GkdcHEUAD/V/jvKifBTxS5yT8ipS6XqKJET9pM/VjD+XGZu83Y4GYhaYjEOOJ+gyaAvbmiFAhScuZIxyCeYMQrjmyJk6ltYRwD+H0yK0nFw1paCogjlrkg6ZQhDck4r2bIWV0uXF9TsVVVERnwuQQBJd0ptXvPnxtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510208; c=relaxed/simple;
	bh=VR/AS9SXJ2nXa2F5ioshmvxaf/viszDfWh+ebD6j7Po=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GgPLYrBfL/n2AFVV5b4W0tpn1uJuuVPNFRTjUxbJzLi/B783DbTttZU0CB9tCo4ynCGzl4mdOE+k9hahAL8BQlM31VE6OQhcGBTxekqUyRRoc3h2lrQ4noZFvJwzB4//AZWo9s7buJztRryNfqnrTRAS8AiLiJpQfV6S8BnUQbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A1DZS3W5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A1DZS3W5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3DBB1F000E9;
	Wed,  8 Jul 2026 11:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510207;
	bh=RhSwr4VtnfIs8OV54VildUiQ+m0GAaepedgyyw+3ZlU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A1DZS3W5wLZBxoJIFHksBqdYPKeBc0TaluqW08n9AsxeJEVwuBm8gMqmZ/g0iAoiv
	 0yLbwNp5W8+UtVYfUhMkDiE8JnUaNqwLHq5AaUYEiHl/M/cFuhf+LwNwJc7OiF68Di
	 5C05hUFOfVViDcSyV3psvMGNQ9BdKm/5q+APWrSYE7LEK4u0EAxMlva99fTdOKXa1v
	 fmbUKqNxSXSAAsBNNlGX6VQrP3imV+Hjkwqr4BFCqBzvgXW32OYDOcvZro48XnqzwG
	 3rSNkTvbm8KQBXknPyC0abJT0jKVO5bv3dIwb9Sl58htrBsclMistObh69Ti8W3Hp8
	 PNf0GqReLRmYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 12/23] mfd: intel-m10-bmc-pmci: Use named
 initializers for dfl_device_id array
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <604eb0616b7a3b466808ab6d947a0cd939effddc.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <604eb0616b7a3b466808ab6d947a0cd939effddc.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:30:06 +0000
Message-Id: <20260708113006.D3DBB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] pmci_flash_bulk_read and pmci_flash_bulk_write incorrectly handle =
unaligned sizes, dropping remainder bytes and potentially corrupting the FI=
FO state.
- [High] m10bmc_pmci_remove destroys flash_mutex before managed child devic=
es are removed, leading to use-after-destroy.
--

--- Patch [12]: [PATCH v2 12/23] mfd: intel-m10-bmc-pmci: Use named initial=
izers for dfl_device_id array ---
commit d38fbca8e0d6c9a4d89f55b7970cd697c0c54a46
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: intel-m10-bmc-pmci: Use named initializers for dfl_device_id array

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

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
This is a pre-existing issue, but I noticed a potential problem in
pmci_flash_bulk_read() and pmci_flash_bulk_write() when handling unaligned
sizes:

drivers/mfd/intel-m10-bmc-pmci.c:pmci_flash_bulk_read() {
    ...
    blk_size =3D min_t(u32, size, M10BMC_N6000_READ_BLOCK_SIZE);
    ...
    size -=3D blk_size;
    offset +=3D blk_size;
    ...
    }

    /* Handle remainder (less than M10BMC_N6000_FIFO_WORD_SIZE bytes) */
    if (size) {
    ...
}

If the requested chunk size is unaligned (e.g., 5 bytes), blk_size becomes =
5.
Subtracting blk_size from size reduces size to 0 before breaking the loop.
When the loop breaks, the remainder block is skipped because size is now 0,
silently dropping the remaining bytes.

The same logic applies to pmci_flash_bulk_write():

drivers/mfd/intel-m10-bmc-pmci.c:pmci_flash_bulk_write() {
    ...
    while (size) {
        blk_size =3D min(pmci_get_write_space(pmci), size);
        ...
        if (size < M10BMC_N6000_FIFO_WORD_SIZE)
            break;
        ...
        size -=3D blk_size;
        offset +=3D blk_size;
    }

    /* Handle remainder (less than M10BMC_N6000_FIFO_WORD_SIZE bytes) */
    if (size) {
    ...
}

Does this loop logic incorrectly handle unaligned sizes, dropping remainder
bytes and potentially corrupting the FIFO state?

[Severity: High]
This isn't a bug introduced by this patch, but could this teardown sequence
lead to a use-after-destroy on the flash_mutex?

drivers/mfd/intel-m10-bmc-pmci.c:m10bmc_pmci_remove() {
    ...
    static void m10bmc_pmci_remove(struct dfl_device *ddev)
    {
        struct intel_m10bmc *m10bmc =3D dev_get_drvdata(&ddev->dev);
        struct m10bmc_pmci_device *pmci =3D container_of(m10bmc,
                                          struct m10bmc_pmci_device,
                                          m10bmc);

        mutex_destroy(&pmci->flash_mutex);
    }
    ...
}

The core driver uses devm_mfd_add_devices() in m10bmc_dev_init() to register
child devices, meaning they are dismantled by devres after the
m10bmc_pmci_remove() callback returns.

Because mutex_destroy() is called here manually before devres cleanup,
could a child device executing a firmware update or being accessed
concurrently during device teardown attempt to lock the already destroyed
flash_mutex?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D12
