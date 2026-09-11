Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E1C351C1C
	for <mfd@lists.linux.dev>; Fri, 11 Sep 2026 09:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789118043; cv=none; b=iy22WirHwalvCH96nTUqKZj1b8y7R5Ob02w1Vva8XkcEDtd1UrCVITkB2RsSHWcbCbC+5jnq0FST5b9Bvf+rQvnOa/zCUA72RiNGHvGCvmKVK/A04m8iboulO2hUxWkj69HtFp3cV24zRD4BgGdu8m7MUxb8dR5816nw1+uCV1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789118043; c=relaxed/simple;
	bh=sMTnoJjYqFn+bpO0mOPzJtgE1jcJ/2FM9bv6OkIWhXU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dcu0JWUSrn9sQYxYvQqtVyvHmJC0+b+s0H8AGjBMdo6z2u7gpMLpWrQeK1DEn3Cy70YDNEdeVt2iwPiNSv2XRDp/0TZXOExxVksf32f0WJS1elmnvzA74Tpgpntov5sBeRfrjLqf/+nWV7+Lw3EhbqQa6FYFsmI3VS65/Htn17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJYGn/v1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJYGn/v1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8991F000FF;
	Fri, 11 Sep 2026 09:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789118041;
	bh=sMTnoJjYqFn+bpO0mOPzJtgE1jcJ/2FM9bv6OkIWhXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dJYGn/v1RYKaLPWmk5Kxd+H0rUs0yHdwyugOKx+0OHX62K6+0L6rxmboFHUs6QGAc
	 m1jKfDF5q7gG6ln3c/n0Q85/aZOpCFA7T23Ck2sJ+ej5HCUlAm+Qs1kI/5V1MU5ovZ
	 Ta7p6YQGjiOLgPF+IAtKSLosvVlI70b02GvCKRllsGaCv74fhcOQWVRxHcezd1zYPh
	 ymN4KROLUVhKSOJFXlaUgRljcWw2umJ3sWOcNHYxC5oEIm1FnfHSUC05rfZGm0K3+g
	 8ZNt3HyYz1tZmSm9aM8AVIfnlYKeskfIHzUBCJLmy5ip/UmWIsnTxj2/IteuI9Bq3s
	 hV2zTM0hz1DPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/2] mfd: loongson-se: Add multi-node support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Qunqin Zhao" <zhaoqunqin@163.com>
Cc: lee@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260911090256.7834-2-zhaoqunqin@163.com>
References: <20260911090256.7834-1-zhaoqunqin@163.com>
 <20260911090256.7834-2-zhaoqunqin@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 09:14:01 +0000
Message-Id: <20260911091401.8A8991F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>

> From: Qunqin Zhao <zhaoqunqin@loongson.cn>
>=20
> On the Loongson platform, each node is equipped with a security engine
> device. However, due to a hardware flaw, only the device on node 0 can
> trigger interrupts. Therefore, interrupts from other nodes are forwarded
> by node 0. We need to check in the interrupt handler of node 0 whether
> this interrupt is intended for other nodes, this can be accomplished via
> shared interrupt handling.
>=20
> Signed-off-by: Qunqin Zhao <zhaoqunqin@loongson.cn>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911090256.7834=
-1-zhaoqunqin@163.com?part=3D1

