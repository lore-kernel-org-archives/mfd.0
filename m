Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793448846;
	b=un44lSrGFlZR2BT1B+TNYL5JRb7QUOK7LrhSzfME8eENb9DQhQ+8Wkw+OBx9RCuUibmz
	 sQMJrQvHXHUUjXQP9yxfaLSBBg1y2JE2jylKDGMHgupo16hUr3yT8DHjJCzxxtrjIaNuq
	 UpCjKVTcU7AIxHizAVPsWuj4l8yV4lVpk8xx5YCHR+vfs12hRh9iDVJ+LaVli7VXPzOfw
	 0jQc0/LPMY6nTrYAgtc15o9yqZHIKqu25NCPRkIcYzBohjbZIDWrgmRfbKSwFy5Fgreo/
	 nlqZyxcyeu4ssMkwJE4XvxAJvUuB2JgZ6NaXamRwO1td8hGxZuMVh0k8NCwtNSQGmRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793448846;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Q2uC7VxcfBZ583/qG7PLxMNvcI1B7rlvF3r1oodUFFk=;
	b=URvD+4kxuWNi7AyuH/i5d0c4DjEAeXiMc+uwLHikqWRDEfcmBFWOxcmUE13fcGD1YIl7
	 Q8L2OmjjPMIVX7SLRgxq4kv6g3eqPIVlAIC7pYedmP19gEH4uYh3YA9K0ZHMvDvbCr1KB
	 bbDJkV9MPruovicYAlO2DOtTul7SLq1MSDe3HvW3FaT+1Jku48ztHF4Ai8hiM6n3p/eVG
	 6339bNC4Bgckgum24pOBdMMTXhqzVutvUahdjcBjqQOkGfIl4SYNtY0lY1oPRFta4Tf6f
	 LN1Y0AnD5UW86wzs/HXEmb6amUDWtFyxe4B1kPtDyv9tKdDM1wkyQYYo9V1GzKxBS+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bPAabyAA;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051EB606A31A
	for <mfd@lists.linux.dev>; Sat, 31 Oct 2026 12:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 051EB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=bPAabyAA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793448843;
	bh=Q2uC7VxcfBZ583/qG7PLxMNvcI1B7rlvF3r1oodUFFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bPAabyAAkYVJc0OHlHOf96fQEKTPsF/k+f6DmRmjU+of+l0GjROMlTl/WrMVHqgTC
	 Wn9K9L/Lw4JH03Blb9D6fP6VfLvERniVOUBSD2YSC2NnPQDEbP4LHGq0t8f+hV1pvx
	 Pr0+/WBgn29/13s6h12ZN8ShcoNifuxm3dCa0e0KaQlL7A4SWpA5XQK/2wvmL/IJDj
	 GjNpuWgy3x+Og9wtNCXnZK1AQB0yquuGI+nbTqfmGqbVxG6xFih8uJ+B7G6HfsSgVY
	 fazWJ4fi5WdF+lCJNOB3WjTW3ajBjbMUVVyyjMNviEpMtqFpsdXGfZvex5qH2G87+L
	 utxrXJZukbgTQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CEC0417E07EC;
	Sat, 31 Oct 2026 13:14:02 +0100 (CET)
Date: Sat, 31 Oct 2026 14:13:52 +0200
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Lee Jones <lee@kernel.org>, stable@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
	linux-actions@lists.infradead.org, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] mfd: atc260x: Fix potential use-after-free on probe
 failure
Message-ID: <auXbgFi3pmoaYhI2@collabws.localdomain>
References: <cover.1793377422.mfd.git.liguangshuo@mail.sdu.edu.cn>
 <344536111bef51c4ee95740e2e17af26ca26929e.1793377422.git.liguangshuo@mail.sdu.edu.cn>
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <344536111bef51c4ee95740e2e17af26ca26929e.1793377422.git.liguangshuo@mail.sdu.edu.cn>

On 2026/10/31, Guangshuo Li wrote:
> The IRQ chip is device-managed, but the child registration failure path
> also deletes it explicitly. Subsequent devres cleanup can then access
> the freed IRQ-chip data. Let devres perform the IRQ-chip teardown.
>
> This issue was found by our static analysis tool under development.
>
> Fixes: f7cb7fe34db9 ("mfd: Add MFD driver for ATC260x PMICs")
> Cc: stable@vger.kernel.org
> Assisted-by: OpenAI:gpt-6-astra
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
