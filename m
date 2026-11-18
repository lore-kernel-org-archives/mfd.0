Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794990844;
	b=bEQ4JJPzgJMbZaheduRyDtQLPnVpu3ONNlurXFimqD+sw/Ou8ydCnW76BdzR0pEvgXOH
	 OQNGGmmh5fzW8g5wv9WCNdkY+h3LxoB0CxF4DGFbiPSaOzGZfFVFklvUQqMgQOJAZ/pk5
	 yCTtuaOBd4MKmtFGDwYjkSww1BU+TcEpiBf7aavT1EVgnH5pvC5H01+OysKIgD1u4io+N
	 aQNmbbzNURVcQM3bwroGObs800Kew4f+Q7sYsXD0HdwL1S4MHmEuhKEEvrMsDgpA6naS1
	 9upATtSJOWqpbWmJjnMnnWzfph04tsikc5+E7ESRmeKlCEjelC4o4yrBBL2QHRCILwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794990844;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=94Do/M9cu5KuHYAGZfobDx4IDqLqkv38Js4JxZirmk8=;
	b=Ag8rj66CyF9Nnw7QlkDQEbZKLJ+7r172HesTTS6FWdqpNVyrpvbXDRjX4/eJGZrZrN4o
	 2veSj8cotXKy2HS7LojWjD1/FXsNhcA8q/oZxLpmmOP4zHQtIYbs+7KODWvqqkDUf8JW6
	 QoZ+U49wAxuBKTXusqgzLDvrufdbg85GAxOTYSkvNHzAs40kSIfGNQxaz7SZDJ727NFAZ
	 +KO9Ei1DXEp+sIM7RaYpLpntjMF6sHl6wknAmXNbNlz7mD675tes2DBLFnjd/XH3vC9mI
	 ZofWNC9ZGO/p7KpHlNV3aRd/hOQFU6shIPPiKV7BZ4uhN4RZOVW5r8lhlzvFu5co9hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtclMDhT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B81E606A31C
	for <mfd@lists.linux.dev>; Wed, 18 Nov 2026 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtclMDhT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2DED1F000C4;
	Wed, 18 Nov 2026 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794990844;
	bh=94Do/M9cu5KuHYAGZfobDx4IDqLqkv38Js4JxZirmk8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AtclMDhTqtWEgUSyWnRPhdW/0MGsk3erp4GEKWA3rxTZHXBuQmoq4jxn8rwXjihaj
	 gWl/l4EtlGsnvB8ITIBGv2TP4OsS9/tPv2i0ckK/7uFw9HOdfOWkK73z3OCPnAQCby
	 Ak5ev9dceShRKzqJ2kwKCnRqaSjSd4fv1+gK64y9fX5lGXiPK7TuxwqgiVoDK37RRb
	 Z+cfxlx7KytsjT8rmRW+aW+faCTDp3KCO4h98bfcFggvzS5HSfD4K4jppt6eHdggrG
	 0qJ+xd6eNwcwThsCCyKTCAwh2QWn5XV88l/OQqqMya7XyfnmpJgQbR2QkrWeWFJ2wg
	 j+g7hXJ9BVehQ==
Message-ID: <sashiko-outbox-220458@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 10/13] mfd: nct6694: Extract core device management
 into a separate module
Reply-To: sashiko-reviews@lists.linux.dev
To: a0282524688@gmail.com
Cc: mfd@lists.linux.dev, lee@kernel.org
In-Reply-To: <20261118081625.2399247-11-a0282524688@gmail.com>
References: <20261118081625.2399247-1-a0282524688@gmail.com>
 <20261118081625.2399247-11-a0282524688@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 08:34:03 +0000
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list

> From: Ming Yu <a0282524688@gmail.com>
>=20
> Move the IRQ domain and IDA handling, which do not depend on the
> transport, from the USB driver into a new nct6694-core module. The
> core retrieves struct nct6694 from the driver data of the transport
> device, and the transport keeps registering its own MFD cells.
>=20
> The USB driver now creates the IRQ domain before submitting the
> interrupt URB, and kills the URB before the domain is removed.
>=20
> No functional change.
>=20
> Signed-off-by: Ming Yu <a0282524688@gmail.com>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261118081625.2399=
247-1-a0282524688@gmail.com?part=3D10

