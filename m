Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795129577;
	b=VAFZqlqoMzogk8HJk5LEKo/zIu1QgrJisdpAmg+ZmSVpU9HCQRPBM3B0gFGCr8Dwke7I
	 QrrRcMQ4PJ3fYbjnANMUoJTUjnWA3MFAXa36dx33KEsYYkg+Nl1nx6wJnv9e3SA7YyeIR
	 jobqRdGgEpeh4o2t0bF3oT65ujjtc6+smb3XFzq1foMtA0SXoU1UbGybCG0u19oq8WM2r
	 H2ZHR6U67wyA0KwHpkfE5ol60BnCRm8mdjr/aLeJPwkHieG+rxcc5hQ+zK+BBW2TT4OGA
	 x/KSZe6QpriF75tWvisc+NKL8rWFr529fKHYrs6I7UY+W0i+EiCTFVmQtHaY2o3hXPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795129577;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=c2wcJSy191Sf7d/IySA1wmn/KvQ1rPLNxdHXHM+fBb0=;
	b=q7aX6dWkdWgZjp+34A0hAhYgRtHKWIzFui8swVwzz9tb8ox9i3UNlsOfgKYfboFT2jV4
	 h5//7fyHTroxtpxv6fHw5Luodj+Co6doY+zKKpGtMOwEYJy7gTLuHthPlucstc2SJFbHX
	 2aJz7q3NMRVSOlfJ/qbXKSsFbHRUl6FL6Qdq/sVC56f6wVF3LESePb6rzCky6U4lTctUj
	 cHnNfsh7x14l0wyOgMMQv79NZNviDwhXYjKvWBtCYFqd8s7BQLJDA1R3RaW/2aJTNjkSW
	 +1by4PE/VxZ1Uj5BRsMqgcVUdtzFJhADCD8Bn1JE7fhFU3WV04qXwGLdwRx5wfokb2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FO2d75cW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88171606A326;
	Thu, 19 Nov 2026 23:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FO2d75cW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186711F000C4;
	Thu, 19 Nov 2026 23:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795129577;
	bh=c2wcJSy191Sf7d/IySA1wmn/KvQ1rPLNxdHXHM+fBb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FO2d75cWx84mrxM/Q61IC5bHYN5D4VdYfUgKISQ6fCg8yWN1AGnRdYGqbAcEZQn4C
	 02W6uIr0rc/HJXdxzfpC7ocRhPJka6Zr24ldhDbwhWX+DJqtwTJbLfpa3uBgQglrYe
	 NRM2kEoJs7wGN6E57/+tyoP6xVPt/RE+H0768J7u8fQCzgkmS3jIIktzrXtpucp5Q5
	 mQV8s5uoUG+GuFgBUE9N8B63ib+iKoyK3W6wFaiNGjrX5TYaX0FmtXZy6/nN09gPoz
	 r1zT/gm6CT383dO4Kpu6srlu673fdNuxMMQ069kkBLZNgGGDRrGeb9TpWYiOLdBYev
	 vKHKmU5K3+a7w==
Date: Thu, 19 Nov 2026 17:06:14 -0600
From: Rob Herring <robh@kernel.org>
To: James Clark <jjc@jclark.com>
Cc: netdev-bot+sashiko@kernel.org, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
	pabeni@redhat.com, richardcochran@gmail.com, krzk+dt@kernel.org,
	conor+dt@kernel.org, lee@kernel.org, s-vadapalli@ti.com,
	rogerq@kernel.org, bigeasy@linutronix.de,
	martin.kaistra@linutronix.de, vadim.fedorenko@linux.dev,
	r-sharma3@ti.com, robertcnelson@gmail.com, nm@ti.com,
	vigneshr@ti.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: ethernet: ti: am65-cpts: implement
 PTP_SYS_OFFSET_PRECISE
Message-ID: <20261119230614.GA1147583-robh@kernel.org>
References: <fd826c118aec02c06bde92ff9c20f1958c214b3d.1794284248.git.jjc@jclark.com>
 <179446830443.2199510.10552580927894870264@kernel.org>
 <20261117004133.1594972-1-jjc@jclark.com>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261117004133.1594972-1-jjc@jclark.com>

On Tue, Nov 17, 2026 at 07:41:33AM +0700, James Clark wrote:
> > [Severity: Medium]
> > Is it safe for this driver to own the EXPBIT_SEL field of GTC_CFG0_PUSHEVT?
> >
> > The register belongs to the SoC-wide GTC, not to the CPTS.
> > am65_cpts_ptp_getcrosststamp() rewrites it on every PTP_SYS_OFFSET_PRECISE
> > request. The previous value is never saved or restored, on success or on
> > error.
> [ ... ]
> > Suppose one of those consumers expects a different exported bit.
> 
> There is no other user in the tree currently. If in the future something
> else in the kernel wants to use it, then the solution would be a small
> driver to mediate this. If there is a user outside the kernel, I am not
> sure what you would have me do about it.

Would doing this imply a DT change? If so, your binding is not future 
proof.

> 
> > [Severity: Medium]
> > Should val be checked here, to confirm that EXPBIT_SEL now reads back as
> > AM65_CPTS_GTC_PUSH_BIT?
> 
> I agree this would be an improvement and I will do this in v2.
> 
> > [Severity: Medium]
> > Should a failed syscon lookup be fatal here? A bad index just below only
> > logs an error and leaves the feature disabled.
> 
> A ti,gtc-push phandle that doesn't resolve to a syscon is a broken
> device tree, so failing the probe is right, and it lets -EPROBE_DEFER
> through.

Not the kernel's job to validate the DT. If something in DT is optional, 
then whether it is missing or wrong doesn't really matter.

> 
> [ ... ]
> > With CONFIG_MFD_SYSCON=n, the syscon stub returns ERR_PTR(-ENOTSUPP). Any
> > DT with ti,gtc-push would then stop Ethernet from probing.
> 
> MFD_SYSCON cannot be off here: TI_K3_AM65_CPTS depends on ARCH_K3,
> which selects TI_K3_SOCINFO, which selects MFD_SYSCON.

Is that true for *every* kernel version? Again, better user experience 
IMO to just warn if something is missing and continue on enabling 
whatever you can.

Rob
