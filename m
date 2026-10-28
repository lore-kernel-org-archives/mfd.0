Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793202627;
	b=k8p1jrp++nqwh54gquB+NdK/CElQ0JfcPkSJqw4bOgVQZ48GlR/jLigYksk6+VAV0QV8
	 NFd2l9UB3p1zNG+yNDIxWqsKoCyLJlDE5A6TrmmwS7PxGCOQDr8wRdyuCxeFnL+IAfpoZ
	 DkxY4qDWyjJgVWwqY/dzGDhp4TjV8bFIuhtF4ClGI6Lm3diDBxufVKHQVIfMYXQ7JjR9a
	 cHX59/Tj5XTw6CvWfOwahQHNVkeIa33aQ71/sFDjIUxQ1tgpGIft18efxYkblJB4TV48N
	 6VGU/D6c1drYCBBpOcCgvIi/LnrXNBT7kwKNzU+NTsQ8LFEaBsdorAFL/BT+VzvFzag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793202627;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=P5gHNQzeRGB5ay4L4jhyXK5TgEBlTihVO3XydtF8iLo=;
	b=w0tDLf2Xzuxs75oo35YaPl9QcElcaZnlcCd6HAcPqqWBOvZOnxAKmnuIN6OMYS5dHCgE
	 e9E6XOdCpqzPClZzqRMhLt8NdQb4y2vi1oZTXgVVR4zdnhxk8RLc8trLnbZlOTNlku8vV
	 nZlEOMRdQcCcgGW/TEzsoA8QKJycu0nZhgxcJXZbsIosTRoEnfdcrUeugPlOQczRd0RWR
	 R2pjNUIgPuaiKQOVbMUtR7qdu3aD4WIdxr9BEs9tFRpcr8YwkWfeZ44UR3PhbFr6gtk2Y
	 E1cHO5puILMPwNVeUTKSJK2V3EZfK5S9Py/5hCjChWiBJfNTjC2A47tn9XEoZH0TZ4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b="XZ0/f7o2";
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34294606A325
	for <mfd@lists.linux.dev>; Wed, 28 Oct 2026 15:50:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34294606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=XZ0/f7o2
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xM5us-000000010hs-1jOV;
	Wed, 28 Oct 2026 16:50:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=P5gHNQzeRGB5ay4L4jhyXK5TgEBlTihVO3XydtF8iLo=; t=1793202618; x=1794412218; 
	b=XZ0/f7o2veiuVc7pLXDBWByqEM0mfFXxeJixN7FLhuyCt5/gYuSrETpW+OySaErn2xUcfQtpukg
	nITnlVtwDKFwj3V0gra8EYwYQWyNRBONCFLrMxo5ioJs0nlSVNZ1QQu28xFeVClOfAMSmL5vqVIk+
	LocTxowgpYZKN3sbfrGOE95+QJguZ+hTolak6MRxOD+yH+/NkASk4R+b1mm/UOj/B9aqMTrSwdx93
	6piDB4ssoUGu/xqdoe549MrOpbc5kOI8gwnE5Au5CgJLGCBXfWKhyMbr/d6At6C05V8NhMY9JD6JC
	R88jzXfK5Az1zVNMYnDtu6z0F2DqLyI0OxfQ==;
Date: Wed, 28 Oct 2026 16:50:03 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Lee Jones <lee@kernel.org>
Cc: Aaro Koskinen <aaro.koskinen@iki.fi>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Kai Svahn <kai.svahn@nokia.com>, syed khasim
 <x0khasim@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>, Samuel Ortiz
 <sameo@linux.intel.com>, linux-omap@vger.kernel.org, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 13/27] mfd: twl-core: Clear twl_priv pointer on
 teardown and probe failure
Message-ID: <20261028165003.60d0c033@kemnade.info>
In-Reply-To: <20261027093306.2812695-14-lee@kernel.org>
References: <20261027093306.2812695-1-lee@kernel.org>
	<20261027093306.2812695-14-lee@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 27 Oct 2026 09:30:42 +0000
Lee Jones <lee@kernel.org> wrote:

> twl_probe() allocates the file-scope twl_priv state with devm_kzalloc()
> and checks for a non-NULL twl_priv at entry to reject multiple device
> instances.  However, twl_remove() and the early error paths in
> twl_probe() never reset twl_priv to NULL, a failure when adding MFD
> child devices bypasses twl_remove() by jumping to free instead of fail,
> and twl_remove() tears down the IRQ domain and dummy I2C clients before
> child devices are unregistered.  After devres frees the underlying
> memory on probe failure or unbind, twl_priv remains a dangling pointer,
> causing subsequent exported API calls to dereference freed memory and
> blocking future probe attempts with -EBUSY.
> 
> Unregister DT-populated and MFD child devices at the start of
> twl_remove(), ensure mfd_add_devices() failures unwind via fail, and
> reset twl_priv to NULL in twl_remove() and on probe error exit.
> 
> Fixes: 80a97ccd33be ("mfd: twl-core: Collect global variables behind one private structure (global)")
> Closes: https://sashiko.dev/#/bug/linux-73e82f84-94de-4d08-82a4-f22d42a1dedf
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

Hmm, couldn't we use devm_add_action_or_reset() for resetting the
twl_priv pointer? Feels more clean for me.

Regards,
Andreas
