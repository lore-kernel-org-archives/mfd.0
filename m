Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11644E50A5;
	Wed, 14 Oct 2026 09:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791971749; cv=none; b=oFwltUQs3QPFjZItVnNJOwiA1zQFKZ/Dp5Lk/y78OLhqcJddx4axTO/PQwWU0pS1uIaYYRvkpIJrDZyijHrsVg/mmrLYoLR9L02wNEEiDJaxDfCq8Ho2kIT5KUsxEJaAa1zJM61kh6o4s7filQ5WoGAOhneptgstYfbp7E22qcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791971749; c=relaxed/simple;
	bh=hBucbV0NeE8swzIFIjB1oIof6t7YW8EfIUDhvnEsafU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=MOOrih3ZeTWrR2a8pQfp8G2uYnCN6WgTPQ2gNy2xdSf2lAGu06zB0h41fpADY9j3VfLd6glhxiHxZYML8sGS/9aisLAGgz7cQEe9UxScN6W55pR8+QtElM92h3wtAIi+3kpujvNOf0ml/HTbys0QHzy8m+xNIiMKBqzvPPdxqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DtS7NzZ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DtS7NzZ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58D591F00898;
	Wed, 14 Oct 2026 09:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971748;
	bh=hBucbV0NeE8swzIFIjB1oIof6t7YW8EfIUDhvnEsafU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DtS7NzZ8XaTT8E3B2HiwIAgVmRWxOoUL+Gk/XJ1D+v5fQAJ7wbC7p4EuJZhNH4Yz/
	 6L5izmpIp2uidK8m9+Va9th3IuKqn3ccwoEccNgSZYym1curUlZA2iWHyrI9xmbqC7
	 JxbFAbhIEa3w1NEbAlrjx3bUfIULiNInW8udJKuwE4wbFTtRA9PlLwxYIki5BdL6vA
	 k4qGmHldpqX11RwHdpwH2zvkO9W9u2wan6wQGGmMwPs5TxcAKiYL2QMD7X7dk3ePfw
	 n6HFx2/9WUhwLSQT9jSomjJpJuM/HlbdpgN9FJF3+NMZEzlhKAtdYUEphuTUsblnWC
	 hYYXB4QjcZPKg==
Message-ID: <sashiko-outbox-171108@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 4/5] bus: Add a shared BCMBCA PMC3 PMB transport
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261014-xg6846b-bcmbca-xrdp-reset-v1-4-daf5d177e113@kernel.org>
References: <20261014-xg6846b-bcmbca-xrdp-reset-v1-0-daf5d177e113@kernel.org>
 <20261014-xg6846b-bcmbca-xrdp-reset-v1-4-daf5d177e113@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 14 Oct 2026 09:55:47 +0000
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] bus: Missing sparse lock annotations for transport lock functions
--

commit f8e671cc4d072dbd3353e224bb3d5cee80468de7
Author: Linus Walleij <linusw@kernel.org>

bus: Add a shared BCMBCA PMC3 PMB transport

This commit adds a bus driver for shared access to the Processor Monitor Bus
(PMB) of the third generation Platform Management Controller (PMC3), initia=
lly
for BCM6846. It serializes complete register sequences with a mutex and a
hardware lock.

> diff --git a/include/linux/soc/bcm/bcmbca-pmb.h b/include/linux/soc/bcm/b=
cmbca-pmb.h
> new file mode 100644
> index 0000000000000..f95523d52e01b
> --- /dev/null
> +++ b/include/linux/soc/bcm/bcmbca-pmb.h
[ ... ]
> +/*
> + * Processor Monitor Bus (PMB) operations sleep. Hold the transport lock
> + * across a complete sequence, including read/modify/write operations.
> + * A successful lock must be paired with unlock, including on errors.
> + */
> +int bcmbca_pmb_lock(struct bcmbca_pmb *pmb);
> +void bcmbca_pmb_unlock(struct bcmbca_pmb *pmb);

[Severity: Low]
Does this code need sparse lock annotations for the transport lock function=
s?

Without __acquires(&pmb->lock) and __releases(&pmb->lock) on these
prototypes, sparse will report context imbalance warnings when child drivers
call bcmbca_pmb_lock() and bcmbca_pmb_unlock() (when built with C=3D1). Whi=
le
sparse has limited strictness with mutexes compared to spinlocks, adding
the annotations can prevent build-time context imbalance warnings.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014-xg6846b-bc=
mbca-xrdp-reset-v1-0-daf5d177e113@kernel.org?part=3D4
