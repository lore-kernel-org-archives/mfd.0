Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DACB36E467
	for <mfd@lists.linux.dev>; Sat, 25 Jul 2026 21:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785013844; cv=none; b=aGfXnSJOHJq0l9MuyklHQusRKEwgIUlrkyw5P8sJHxoWqHyGuNZPHfR0UoFkmOY8dc+pstDXJxWOu5VnrLliOGQ/riH3YcXV/9xhZdvTPAkvar2C9zIKaRnex7RrOqjlkX99Jayn4k52EucrCbTedYV4SAiUkvVEQdjIVXvM2E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785013844; c=relaxed/simple;
	bh=fk3n7AJoTVrg+a3rWw+w/o+7izFFSsDzI+zr7tjvZgs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qo+vNKZO8Abf8c4pY4aoy9UzbikX+LKQ8XMLmKxIwKIHpQYPOFXu0uXfcrT08mCqD7RcwFsFVLGpYn3YVmLg+GsjmDZ54iZgFgTU/qIR70OWfbOjCMOEibKY+QperaCU/JHeJavLzmp1fRwzqT/rJb7AX9xcsR6i27Vul9W2204=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fEemLy/F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fEemLy/F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D441F00A3A;
	Sat, 25 Jul 2026 21:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785013843;
	bh=/xhqNlg6drrhA77HLrTWMcumNzSUZ7owrGzYGjuKgbE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fEemLy/FPhDdHiD/UR0SYzT1D3aF/7O6d/7Y+FMMlaHI21AE+u5NsmGIs5aCuhOvj
	 /UZw30qsIps7JFhn5vIhh/TGvVjOzBtpRyi9kJq05Y86c9VO0vbQxNmIYRxCYo/99q
	 EviWhJc+1YYvXPqsqvy8p38TZ1t7Yf6F+Br0RwGxmDahoSE+tsYJOEqlrAck0WVLOy
	 0zsvqbWJaS0GNF/qCC0His9LRbV4MQK/qNxDuFk0OBhj5bE/U7NXsT4X2KjPWGH0U6
	 lsbLcK9prWT4TvNCi1hzbB60Eljs/X+2ATEK9Q5mrxz5Z5yPcYZX/ahdg6QPsJPa1s
	 LrUojPhwkNrPQ==
Date: Sat, 25 Jul 2026 22:10:39 +0100
From: Lee Jones <lee@kernel.org>
To: Miao Wang <shankerwangmiao@gmail.com>
Cc: mfd@lists.linux.dev
Subject: Re: [PATCH RFC v3 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
Message-ID: <20260725211039.GF3526803@google.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-7-ef718636e78e@gmail.com>
 <20260709174055.D25E71F00A3A@smtp.kernel.org>
 <20260723112903.GB3363113@google.com>
 <E1909632-6D06-4648-986C-6B7867D231DB@gmail.com>
 <20260723131120.GL3363113@google.com>
 <73FED0CE-3263-4853-9402-5D0E081EF780@gmail.com>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <73FED0CE-3263-4853-9402-5D0E081EF780@gmail.com>

On Thu, 23 Jul 2026, Miao Wang wrote:

> Hi,
> 
> > 2026年7月23日 21:11，Lee Jones <lee@kernel.org> 写道：
> > 
> > On Thu, 23 Jul 2026, Miao Wang wrote:
> > 
> >> Hi,
> >> 
> >>> 2026年7月23日 19:29，Lee Jones <lee@kernel.org> 写道：
> >>> 
> >>> On Thu, 09 Jul 2026, sashiko-bot@kernel.org wrote:
> >>> 
> >>>> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> >>>> 
> >>>> New issues:
> >>>> - [High] Unprotected access to `gpio_chip` without a NULL check leads to a potential NULL pointer dereference or use-after-free.
> >>>> - [Medium] The ACPI memory resource search for the GPIO controller only checks the first memory descriptor, ignoring any subsequent ones.
> >>> 
> >>> Looks like there are a few of these to consider.
> >> 
> >> Many thanks for your response. I was preparing a v4 to fix the first issue
> >> found by the bot. However, I believe that the second issue is false positive,
> >> since the memory descriptors (if more than one) in _CRS are ordered and the
> >> position is meaningful for the driver. As a result, only checking the first
> >> descriptor is acceptable.
> >> 
> >>> 
> >>> I'm unmarking this for review for now.
> >> 
> >> I still want review for other improvement suggestions. Thanks in advance.
> > 
> > Due to extreme workload, I need a clean or justified Sashiko pass first.
> > 
> So is there any guides that I can refer to to mark for false positives?

Most people reply to the feedback and state the fact, with a little
background or additional information of course.

-- 
Lee Jones
