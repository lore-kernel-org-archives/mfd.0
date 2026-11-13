Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599514;
	b=DxpJ/G9yBlHtIBwWAJNobgWT0hQoW0hau0PcHgG/Sn8Do2GPGo3JQ1BzmPujmmyHDw+o
	 GuaxpGQaUhH8SZ981a7icOGCJ7QiLSGNUsYejXr85uAiHIS2hkx1RZHVbKZoZzoeSa4k+
	 R+SX3UKqmA7JX1vRYjJkA7gKDS5rc/v9o+cXKLLDFzYpGsky1IZfqMXvOwAxQ7dFvk2pc
	 DaJPLHWPfpHO5cRkkL/TwrwlJ/KSKAqKSg/W8xE+pHurKNN5b62/Obt3Gq9dPJ7fatrll
	 F7BfluI2dw8IG0LDcg4W6qlBTY9aMgrfph5Px9N5A6beTVzBdI7v6PhMIYI9tR33NbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599514;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=8ECM7h8v3szvfUHrUOczJsK+T30L8LfIMVGsWq1/EAQ=;
	b=Snzmz4cEQmc1bh5tt94KfF/NxqKuuThSMBxkSL6lhQ/zdq/iU3UiIlYsgM0Zt/da0L+V
	 lsszABUnexA7hldxGXoJGDpTkebDiJj0pjGRWzZcQdQy1sxYUrp3wX8aNjfewVvoipOFG
	 qlaOq7/uwANWj7FINPnnMWDM88nyvLrHaFCgxT81cdb+5rsQuAnmI3HHLYbcWoepY1ueZ
	 oNI8S2bzJFhkdkqa4QG/nC43yA2nqQ9amhU+6hQBoWeFT1D+5mVjXlEnp/kSHJVazgNZ7
	 BwZTgsMTk5cGEAXtNWC6ijT+SHCagl5h1QUqg1p53ZsUegF41c/59uIyKesP+HQxi1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TKv4CrLO;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699DB606A332
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 19:51:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 699DB606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=TKv4CrLO
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D3CF44E415B2
	for <mfd@lists.linux.dev>; Fri, 13 Nov 2026 19:51:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8BBBB60015;
	Fri, 13 Nov 2026 19:51:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2294911BC03F6;
	Fri, 13 Nov 2026 20:51:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794599506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=8ECM7h8v3szvfUHrUOczJsK+T30L8LfIMVGsWq1/EAQ=;
	b=TKv4CrLOPU1pxDCGtU47n42Fa/M0lGNnyJBNXUrj6YqXfiD7pfP3K9J7hfbuJCz5mV5Kpi
	tCd+qVpYYtDYk7SbDgfswEYzfZ1Y6fiKuqSGFWxl8Ni2KCY3EYS2aThqwnREjhb6ar2l0B
	yeWdNl5tT0/8VlzwMv1AO6nPU3JrAAyTIzc/AZsEUw29ZoTsOc7Kd3f/zSg2S4bmAER21/
	x93OnbaZFlnpU71JTltYjNioZjTRDvVL/Gl9/93EOIjWQXXyRKlvbXTbt8ycUMleyRqIUs
	4hWyH/gKm1sFlCJSXJ77z7wlaWgkKuIP7OuetY/Y0aSZ7+E3/4aZK1V2RGpVuA==
Message-ID: <c9d26395-93f8-4e63-9cd0-586ce913931b@bootlin.com>
Date: Fri, 13 Nov 2026 20:51:44 +0100
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Post: <mailto:mfd@lists.linux.dev>
List-Help: <mailto:mfd+help@lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
List-Owner: <mailto:mfd+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] Congatec Board Controller: Add storage devices
 support
To: Lee Jones <lee@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261103-cgbc-i2c-storage-devices-support-v5-0-ac11f23fae51@bootlin.com>
 <20261113194450.GM6323@joneslee-macbookpro.roam.internal>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20261113194450.GM6323@joneslee-macbookpro.roam.internal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/13/26 8:44 PM, Lee Jones wrote:
> On Tue, 03 Nov 2026, Thomas Richard (congatec GmbH) wrote:
> 
>> In this v5, I re-ordered a bit the patches to fix I2C bus names first.
>> I also made an error message more user friendly.
>>
>> Lee, this series conflicts with some other ongoing patches series:
>> - mfd: Assorted resource lifetime, teardown, and error-handling fixes [1]
>> - mfd: Constify mfd_cell arrays [2]
>>
>> To make your life easier I rebased this series on top of them. Please let
>> me know if you want to proceed in an other way. 
> 
> I think these are all applied now - less my I2C patch, which you are
> free to collect.
> 
> I'm ready to apply this set.
> 
> Does this have to go in as a set or are the MFD patches orthogonal?

They have to go in a set because of the switch to PLATFORM_DEVID_AUTO
and plateform data usage.

Best Regards,
Thomas
