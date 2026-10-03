Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84B33750C4
	for <mfd@lists.linux.dev>; Sat,  3 Oct 2026 01:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790991197; cv=none; b=DOgrVDbGP/6S3ELA7Hr2DIfhfWSi6oKuDMQSG1R1ZrQds0EJ8Q7AH421Gx1wABk+uIrCdLc/wS6ctNbOwUr+ILOTbpspqRK8OU6IZdRFVj7iu/hgmx8ctLQ2G0pBnHn+nxXmTSwErf0EwXl9ZHuhRjPMxAVnxoBllTJ7NON5hfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790991197; c=relaxed/simple;
	bh=zGDZbhU/yOcFTm7HOHAI+a7FtOiLqjIp3cjfW4HWBUQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YA69WrDrxeK0jUDsTTj7HcpdfnT+dR6efI3PJUvEpgxXL+r9Zd0cdu7iQOIKnBLkahJgLVZYfGk5COQSV1h3ee5JwggkPDjB8BccQaBcdfdaS9jffE0Rk0wFWIA3PEktyg2UcD5f4knlbLcooVsNnnHg1UxWH16BfD9QlLqWjo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MZKjO7+a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MZKjO7+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5573D1F00893;
	Sat,  3 Oct 2026 01:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790991196;
	bh=oXIajkVhGxxyKcbefPpf3pNWBmKZwr809oSm50A3Bo4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MZKjO7+aMgcl+v+6dA3UfgxkxL5vFTU4ffLJv8pxYIo2mLrWbVyd9N5Tjq9fDFMVL
	 nZmlf4QH2m7KHl74H/SReQaZTR5ebS4Jyql/WMSFkK2zbwNLizG6akjMcgs0XYttVn
	 gvT2ODd1KbcL/tWmfEvws6WTPkytCVn8l+jTpQTHRqf37oODh7fr7Y4rL9O6EJ2ozX
	 vpsXtcby52DCbKkPtMo6rEvf22srxIBLAqJL5AoKF/Ht9NSMN0F8+btrZWntIUg4QY
	 Juk85y9l6BBlbP97x3AuypmQjTAsUd8fea9/nSoW5yjjmhgDS8aPfkeaz0TcQ41d38
	 +2dU1tVmY7ATw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 31/38] mfd: ioc3: add IP34 system-board entry to
 ioc3_infos[]
Reply-To: sashiko-reviews@lists.linux.dev
To: "Imre Kaloz" <kaloz@kernel.org>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <e9b125b8ab2422717072f447c318eff41062bd79.1790857966.git.kaloz@kernel.org>
References: <cover.1790857966.git.kaloz@kernel.org>
 <e9b125b8ab2422717072f447c318eff41062bd79.1790857966.git.kaloz@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 03 Oct 2026 01:33:15 +0000
Message-Id: <20261003013316.5573D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] mfd: missing const qualifier on ip34_m48t35_cells array
- [Low] mfd: commit message description is not capitalized
--

commit 7d3e4b93a3f3a8869f87ab0153c8c6e16f517b90
Author: Imre Kaloz <kaloz@kernel.org>

mfd: ioc3: add IP34 system-board entry to ioc3_infos[]

This commit registers the Fuel system board's on-board IOC3 and its M48T35.
Bridge-side detection was previously merged, but the cell table lacked an
entry, causing the IOC3 to fall to the CAD DUO default and leaving Fuel
with no ttyS0.

> mfd: ioc3: add IP34 system-board entry to ioc3_infos[]

[Severity: Low]
This isn't a regression, but does this violate the MFD subsystem
capitalization convention? Should the description after the subsystem prefix
be capitalized to "Add"?

> diff --git a/drivers/mfd/ioc3.c b/drivers/mfd/ioc3.c
> --- a/drivers/mfd/ioc3.c
> +++ b/drivers/mfd/ioc3.c
> @@ -517,6 +517,51 @@ static int ip30_sysboard_setup(struct ioc3_priv_data=
 *ipd)
>  	return ioc3_led_setup(ipd);
>  }
> =20
> +static struct mfd_cell ip34_m48t35_cells[] =3D {

[Severity: Low]
This isn't a regression, but should ip34_m48t35_cells be declared as const?
The MFD subsystem guidelines recommend cell arrays be static const to preve=
nt
accidental dynamic amendments in memory.

> +	{
> +		.name =3D "rtc-m48t35-ip35",
> +		.resources =3D ioc3_m48t35_resources,
> +		.num_resources =3D ARRAY_SIZE(ioc3_m48t35_resources),
> +	}
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790857966.gi=
t.kaloz@kernel.org?part=3D31
