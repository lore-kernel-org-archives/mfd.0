Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD0049251F
	for <mfd@lists.linux.dev>; Thu, 23 Jul 2026 13:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784812285; cv=none; b=B9t05v9v3ce325qr/zYQYd3VDym8Ab8T0jJJHToMDhbpDsBgnl8GHwvndJf2nQjCTrbDqPwW7t0AUJUTCD87LRg+96m3dQ312AVG+ZOkI3PY3Xriio50kvax+y1GTlt7KLT588CbYUUuzaHHuq/6UqeAqHiEqZgIfInuYsDOCZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784812285; c=relaxed/simple;
	bh=6PQXJnZxutX7RFrEAdY2fMB5cxTsqQ6Nt60OZUrOFtA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CtfK64vUdkg7UfPW1YI+gIqLV73f+zKryYyg15xKNV0Sxd57jwZJMNXwCxcceNE4cJg6Vf5oGrw696mRWpzXfqGqmmOdX6hdcqFHDOC+Oc1vUqMOEIK/fzOvXUx1I7qehYjkPkxFWmsv+wUWtD2eEUH2qYHS8ME6ErGjpBu1g7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXqdwSll; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXqdwSll"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C0C31F000E9;
	Thu, 23 Jul 2026 13:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784812284;
	bh=DF88iCS2fxLZtG7VmYmHms6eQ0BytnPCqUw4pg3UOUU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OXqdwSllfThlfnf1z+RwLYiOItg2Et5KsHp8Vem6RZ85bR/bYZTTeVuJJIE0GArGc
	 adTq/Nd0Tn4hHPOe8hC6/QTOYLgE4aqrVYs5qQF22UiNu9ZRbQI+d1OIiMFf9UPxlA
	 WEItu8P1Lzow/F0Ya0z4YOlgaBDtUmjegkklV3ykiR+VwKU0o+RctnwKolZ1U7iFkF
	 589xSghXVKsbSyQXUQgl1//KQaQip9Z7x4wI37FBESEHn2m/lYdSBtEzCC+lg/3LNF
	 IS+LY7MWpbGRlIWSxnxMCcH3ig1Cp2Bdx/nyebTLSow+rLH5LOSu5tY6Dv53B2Tyws
	 Lkk1SL1kXRzhw==
Date: Thu, 23 Jul 2026 14:11:20 +0100
From: Lee Jones <lee@kernel.org>
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev
Subject: Re: [PATCH RFC v3 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Message-ID: <20260723131120.GL3363113@google.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-7-ef718636e78e@gmail.com>
 <20260709174055.D25E71F00A3A@smtp.kernel.org>
 <20260723112903.GB3363113@google.com>
 <E1909632-6D06-4648-986C-6B7867D231DB@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1909632-6D06-4648-986C-6B7867D231DB@gmail.com>

On Thu, 23 Jul 2026, Miao Wang wrote:

> Hi,
> 
> > 2026年7月23日 19:29，Lee Jones <lee@kernel.org> 写道：
> > 
> > On Thu, 09 Jul 2026, sashiko-bot@kernel.org wrote:
> > 
> >> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >> 
> >> New issues:
> >> - [High] Unprotected access to `gpio_chip` without a NULL check leads to a potential NULL pointer dereference or use-after-free.
> >> - [Medium] The ACPI memory resource search for the GPIO controller only checks the first memory descriptor, ignoring any subsequent ones.
> > 
> > Looks like there are a few of these to consider.
> 
> Many thanks for your response. I was preparing a v4 to fix the first issue
> found by the bot. However, I believe that the second issue is false positive,
> since the memory descriptors (if more than one) in _CRS are ordered and the
> position is meaningful for the driver. As a result, only checking the first
> descriptor is acceptable.
> 
> > 
> > I'm unmarking this for review for now.
> 
> I still want review for other improvement suggestions. Thanks in advance.

Due to extreme workload, I need a clean or justified Sashiko pass first.

-- 
Lee Jones
