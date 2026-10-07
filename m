Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1744CF37
	for <mfd@lists.linux.dev>; Wed,  7 Oct 2026 09:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365877; cv=none; b=nVhxYWhFE8CSNLTsVflgEHvx4jIGP2avrH6hqTcLKdBQPjfEcINM8E9Yus4GgHGkIrrOgDf7Oxwc1lLRHwENo05i908OZVT+WAJZZmLRdg+oSngQr51HPUVAIvUJ4rPeEuRuca3ndHoRvZMWNEK75zcFfsuhKoiNjXZ4Q49Y07o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365877; c=relaxed/simple;
	bh=NlbftKadKzr/AYyBl6P3UoBz7b+qAe/VBAUdlUraCZA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=U3O49WaFV1YFKv4LRlK1VP4QcSgHRL1d2Wi1n05V1Ulq4B3f368sE9BmSKT3iZB0M1w0eUTloHaD8eyEArQgOFdInorKo0eezzeA+IlzzzrmDdrna1ALK+irKXQeDcxZmsPSRI+Qcq6GmhOAqQcW3Qg9xI6utez1abzGOaPqDTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lMx+DWHz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lMx+DWHz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45AE61F0089C;
	Wed,  7 Oct 2026 09:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791365866;
	bh=NlbftKadKzr/AYyBl6P3UoBz7b+qAe/VBAUdlUraCZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lMx+DWHzeiYZg9ZywUl5MtCiyGBSsri/U4CrK2XAQWvZT6Lj1TVcHOt6+HH96cu55
	 Myx9ypXv2UYhzYWVGVw7v4aeRALcwFGvx+0gQGsr1s3t8uPATkFDMTHbQQ7MIfvCOt
	 2/3dE04lHwXQi56pavqXV7Cis00iwXTokCjSPNaxsxn1wZEmCqVKqdhnxHkDKzS1Ya
	 /tjDmSpoKMktVpaypqqBhAYPQ3On++wbzl6jkctpUOyp3L9Mgj/p6j9QueEd8vo8+d
	 vdZxWUGRKNnmG8sRpuYdakPT/aRIbrhGe4O4k3hosP91s92bTnmZkC1IkULXOCvJId
	 Gh7DlmgGDoGUg==
Message-ID: <sashiko-outbox-162807@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 05/13] mfd: nct6694: Transfer data packets via a
 dedicated buffer
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20261007092102.3768818-6-a0282524688@gmail.com>
References: <20261007092102.3768818-1-a0282524688@gmail.com>
 <20261007092102.3768818-6-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 07 Oct 2026 09:37:45 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Ming Yu <a0282524688@gmail.com>
>=20
> The caller's buffer is passed straight to usb_bulk_msg(). Sub-device
> drivers embed those buffers in their private data, so they are neither
> cacheline aligned nor exclusively owned by the transfer, and mapping
> them for DMA can corrupt adjacent fields on non-coherent architectures.
>=20
> Transfer the data packets through a buffer owned by the transport, and
> reject commands exceeding the maximum data length.
>=20
> Fixes: 51dad33ede63 ("mfd: Add core driver for Nuvoton NCT6694")
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261007092102.3768=
818-1-a0282524688@gmail.com?part=3D5

