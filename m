Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E05843746C
	for <mfd@lists.linux.dev>; Mon, 13 Jul 2026 14:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783954446; cv=none; b=UkjslOF6O/QgE81TuIz256EbMkWhlnCYA/U6UyTGwieaEUbhRRwvayLqwtIMldjNVA6Zmsh3VYME9VVQO+JsBIN5bBDtp1GwZN9WQSAZLOxPyhLVH6aTsINEXPDttJ6FTpjqfa9z6jC4QxnXPxVXaoVjI6Cx6mWHwv/1cMXgBH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783954446; c=relaxed/simple;
	bh=XYVAOQ1BiWmUStDoGw8+T7a/vS7v22C9lWjgrSvE2q8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=C+92SZBOfTb8I0GJzMy2wu0GuzSiLEuWmlb+KAYvkQ8JRyaPqDwV0IhX3eq7OnpBOxtmluzzjXbnsw+6DK7MHQ6CoMt7cF8z/JsDG2apOF3a0zZV0N6qlWuDanJlKyfNG0ZfdO/Kjh3L95e11Q5ohvwx2a3LDIFkYcpZc1bwkZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HgPOjlVw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HgPOjlVw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6B9A1F00A3A;
	Mon, 13 Jul 2026 14:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783954443;
	bh=hRc04UT9+P5Z5ckYK6O4zT4TNj9gqSNhCPnHeIKfH1M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HgPOjlVwgs9mNABBUEbQkC9viJvL/vFOJXTmgzR4n8c7535SHH9OeVIH31+aXS/+Q
	 NLUdc+v91zBiHxurCGYvlXj7EQWRqrhYmh5q2yk20UW5ULdEFRhy7+aZQbSRyyIqYp
	 oBJKIlVSU2ghBpHDfJvnMPWeLE6SzOwkMcTIFbAh7SEPQPajR7vWBD65yYQdaKqfTD
	 dYgUJPS6BgNuGDhj/bHSd70yClHsZW867WQbL+BzYZI6O5R75VgVe/5RuRY3KtOMIQ
	 /h0x9nVMhjEtrEvXIh4A4YP/JP9A8ZfVKsspo0JLjSHaMMepXKkipgpj+zZancbdGW
	 L7VWKLF3Li3og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mfd: cgbc: Fix teardown ordering in cgbc_remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Thomas Richard" <thomas.richard@bootlin.com>
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20260713-cgbc-core-fix-cgbc-remove-v1-1-79274ad62b3a@bootlin.com>
References: <20260713-cgbc-core-fix-cgbc-remove-v1-1-79274ad62b3a@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 14:54:02 +0000
Message-Id: <20260713145402.D6B9A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Truncation of error code from `cgbc_session_command` masks timeout=
 errors.
- [High] Uninitialized kernel stack memory disclosure in `cgbc_get_version`.
--

--- Patch [1]: [PATCH] mfd: cgbc: Fix teardown ordering in cgbc_remove() ---
commit 59b97a15c94c66064a1c8f30345e941eb2fcf28f
Author: Thomas Richard <thomas.richard@bootlin.com>

mfd: cgbc: Fix teardown ordering in cgbc_remove()

Release Board Controller session once children are removed by the core.

Closes: https://sashiko.dev/#/patchset/cover.1783507945.git.u.kleine-koenig=
%40baylibre.com?part=3D19

> diff --git a/drivers/mfd/cgbc-core.c b/drivers/mfd/cgbc-core.c
> index 10bb4b414c34d..2becaf797646d 100644
> --- a/drivers/mfd/cgbc-core.c
> +++ b/drivers/mfd/cgbc-core.c
> @@ -364,9 +364,9 @@ static void cgbc_remove(struct platform_device *pdev)
>  {
>  	struct cgbc_device_data *cgbc =3D platform_get_drvdata(pdev);
> =20
> -	cgbc_session_release(cgbc);
> -
>  	mfd_remove_devices(&pdev->dev);
> +
> +	cgbc_session_release(cgbc);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but does the truncation of the e=
rror
code in cgbc_session_request() mask timeout errors?

In drivers/mfd/cgbc-core.c:cgbc_session_request():

    cgbc->session =3D cgbc_session_command(cgbc, CGBC_SESSION_CMD_REQUEST);

If cgbc_session_command() returns -ETIMEDOUT (-110) during device polling,
assigning this negative int to the u8 cgbc->session truncates it to 146.

The subsequent bounds check evaluates to false for 146, completely masking =
the
timeout error and allowing initialization to proceed with an invalid sessio=
n:

    if (cgbc->session < CGBC_SESSION_VALID_MIN || cgbc->session > CGBC_SESS=
ION_VALID_MAX)
        return dev_err_probe(cgbc->dev, -ECONNREFUSED, ...);

[Severity: High]
This is a pre-existing issue, but does cgbc_get_version() leak uninitialized
stack memory to userspace?

In drivers/mfd/cgbc-core.c:cgbc_get_version(), the data array is allocated =
on
the stack without initialization:

    u8 data[4];
    ...
    ret =3D cgbc_command(cgbc, &cmd, 1, &data, sizeof(data), NULL);

If the hardware returns a successful status but with a payload length less
than 3 bytes, cgbc_command() will write only those bytes into data and
return 0.

Then, cgbc_get_version() unconditionally copies the bytes:

    cgbc->version.feature =3D data[0];
    cgbc->version.major =3D data[1];
    cgbc->version.minor =3D data[2];

This copies potentially uninitialized kernel stack memory into the device
version structure, which is subsequently exposed to userspace.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-cgbc-core-=
fix-cgbc-remove-v1-1-79274ad62b3a@bootlin.com?part=3D1
