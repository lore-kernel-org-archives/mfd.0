Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=161.97.139.27
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793362266;
	b=G60pCPW57+6XojbD6LMVZSl5VT8njESqBSB0UerEmZU4bgL3EAZ1DENH6UYDNL+OboVz
	 EVhn/yTs+NSYtGyv5KFcIdf+ljbf09h2P0J10ochFNpcRBkbHGyFDHAmB04A67R0Hrkhj
	 60JvW+EXoDoDp5S/OEbqvXroQdq07c8CgrAqyMHH+CWEtQSFhN2j9RqbXdFegRCV+Kyox
	 dIjAbZnzxQZUMzMUZBVwV0kTrQN5NELLqhM+fXsDmyEt7jeaX4uABRad3/SnivgAiliNC
	 Vj5q+z4D7qKWH35ypMbXxdWUPE0YjU2fvFe+jlHgVA2hfGrxE+8Ou855Jxh/jdeJXRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793362266;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=0Kl+MHOCZ+R/GW81g7LtxnluF7pHvK7kuj//VGTFoCU=;
	b=eL4gjSX0Z+3EAEWM+O054Wzjkg74UcOB6b9m9E44ipZixRhfg6Igyo9hm61g7eYQUx88
	 skFA5wFGkAVYdnmHgTvNPq7CbQWClXJ865c9ieXIPE3dIhooKQa6qvSUxzAI8RrgqgeZj
	 psKkWt4rquNtIwyLR6x8ggXBVw14CNGdiy5QcI0RVkFh3BsOridWnUMj7p6921q9wu85B
	 x3g0J10U+A8a0Qt/UCoGIiKEsk4a1CNpv8UynC6MTXegJnzOU4NosItLuqEjh6lwooIHi
	 igFyUUJIm7i/zdxYJyIMrS440BbgGE9r3UYJnrPELDFOycBBakukd0B1ibnwq1qYMOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=QOwZ7Y71;
	arc=none smtp.remote-ip=161.97.139.27
Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7713D606A31D
	for <mfd@lists.linux.dev>; Fri, 30 Oct 2026 12:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7713D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=QOwZ7Y71
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <andreas@kemnade.info>)
	id 1xMlRe-00000001Fex-05bl;
	Fri, 30 Oct 2026 13:10:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=0Kl+MHOCZ+R/GW81g7LtxnluF7pHvK7kuj//VGTFoCU=; t=1793362254; x=1794571854; 
	b=QOwZ7Y71m6/ZZDLGbyNNUIcjisbRPLduAgD6qQokyma6mubA+tPDWopFWyrC1dAfrKzpETVJobk
	+V1tpjcn1phvkI9hZewxNsSrdpfi6mHtAnexnbaT0YN9/vkhgbXkHDRIE6U/YtXdmYIy5cG4xScAm
	mtg+ixCI0joM+bkuNWa5oS8Xw9UEREi9U79SVF3eodO6k2JttBaXNRt7k1/NKP6rK6kbX6zLDJCgY
	3lvCOYwX2rX1l1TYU1u+90RC3irAVoQggxqULtdBD1CpxZuRM47c+sQemfN2WuG7UCwqVH+dnJ4+k
	ssE/tKzMr28rggpb+msifaEDQw7frJTKqNTg==;
Date: Fri, 30 Oct 2026 13:10:49 +0100
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
Message-ID: <20261030131049.10167177@kemnade.info>
In-Reply-To: <20261030112835.GD3774906@google.com>
References: <20261027093306.2812695-1-lee@kernel.org>
	<20261027093306.2812695-14-lee@kernel.org>
	<20261028165003.60d0c033@kemnade.info>
	<20261030104806.GC3774906@google.com>
	<20261030115241.642c5971@kemnade.info>
	<20261030112835.GD3774906@google.com>
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

On Fri, 30 Oct 2026 11:28:35 +0000
Lee Jones <lee@kernel.org> wrote:

> On Fri, 30 Oct 2026, Andreas Kemnade wrote:
> 
> > On Fri, 30 Oct 2026 10:48:06 +0000
> > Lee Jones <lee@kernel.org> wrote:
> >   
> > > On Wed, 28 Oct 2026, Andreas Kemnade wrote:
> > >   
> > > > On Tue, 27 Oct 2026 09:30:42 +0000
> > > > Lee Jones <lee@kernel.org> wrote:
> > > >     
> > > > > twl_probe() allocates the file-scope twl_priv state with devm_kzalloc()
> > > > > and checks for a non-NULL twl_priv at entry to reject multiple device
> > > > > instances.  However, twl_remove() and the early error paths in
> > > > > twl_probe() never reset twl_priv to NULL, a failure when adding MFD
> > > > > child devices bypasses twl_remove() by jumping to free instead of fail,
> > > > > and twl_remove() tears down the IRQ domain and dummy I2C clients before
> > > > > child devices are unregistered.  After devres frees the underlying
> > > > > memory on probe failure or unbind, twl_priv remains a dangling pointer,
> > > > > causing subsequent exported API calls to dereference freed memory and
> > > > > blocking future probe attempts with -EBUSY.
> > > > > 
> > > > > Unregister DT-populated and MFD child devices at the start of
> > > > > twl_remove(), ensure mfd_add_devices() failures unwind via fail, and
> > > > > reset twl_priv to NULL in twl_remove() and on probe error exit.
> > > > > 
> > > > > Fixes: 80a97ccd33be ("mfd: twl-core: Collect global variables behind one private structure (global)")
> > > > > Closes: https://sashiko.dev/#/bug/linux-73e82f84-94de-4d08-82a4-f22d42a1dedf
> > > > > Cc: stable@vger.kernel.org
> > > > > Signed-off-by: Lee Jones <lee@kernel.org>    
> > > > 
> > > > Hmm, couldn't we use devm_add_action_or_reset() for resetting the
> > > > twl_priv pointer? Feels more clean for me.    
> > > 
> > > Nice!  Thanks for the suggestion.
> > > 
> > > To keep this fix minimal for Stable backporting (and avoid resending a
> > > 27-patch series), I'll take this one as-is and send a follow-up patch
> > > converting twl_priv to use devm_add_action_or_reset().
> > >   
> > 
> > I think the whole patch can be simplified a lot then, 
> > 
> > devm_mfd_add_devices can stay.  
> 
> twl_remove() runs before devres teardown and destroys the IRQ domain,
> unregisters the dummy I2C clients and clears twl_priv->ready.
> 
> So the MFD child devices still need to be unregistered at the start of
> twl_remove() (alongside of_platform_depopulate()) before the parent
> transport is torn down beneath them, at least until the rest of
> twl_remove() is also converted to devm_*().
> 

ok, I merged the two chunks of twl_remove() into one in my head without
the lines in between... So you are right.

Regards,
Andreas
