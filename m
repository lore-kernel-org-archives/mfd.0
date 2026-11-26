Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795688673;
	b=AGaTu5q5fI1CTrvQO5dzMqF5FW8Bftm/heD2ZYKzp7YP7RRnBijMc8SIvZyQWgpNfYzK
	 vPn9n7BT1iwzRAuf5j2QpKiz5pQB/og9s20szDMrUYKZDKvNrZmaJD4RNCj9yT/AqGd64
	 BaA7HNS7Oo2CWF5nr6YsSNyHW6pYv7H8hZCR1dEiDMPN36Afo83OufRkjyhmdMFWkLOQq
	 Jtr3czUz01C/mmrsScmvjtNKdF0neZVm4W6UMM5u+izUpFdaYxypzX+jecMK2PDzrp9aD
	 sWA9Ploebnm3rP7PdIk6DOAN88GVtH9XETS0at1vz2ox+XNGIS5nkq2I3BQwk5aOhCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795688673;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=HWXhD2T0YqRDo710NdzVWCmw80S5rSuIE5qAwGglR9Q=;
	b=wAD5atmfQ/1wS1vZ/3KrkOEwB+BQEOqSNm+MobQTWEheXJ9FFr7quxlsXRrKF5YIfpRq
	 iog/dNz85EC/aoS5h3MqEVM8llnX/nR6nF23/tnXziwyvCarbO73reQuFl3qp7gCi4lDp
	 UAOM35JSIA5pPSIS2shI6Dn9Nuvr7Rgam+EoVlULerwK8RAAGBi7pWjpHEQ+ms29j/hH3
	 2xGgI0utXZEjgl4RsP662mV0ysHR4P9CoJ9OAsHNYbMYjuNBwUCO5gLfeCbmbG5YCCGyH
	 cFCvJeF+W2V5dOOhD+KnljjYHqmMHySrQFlOkW4OLwOUoGOVxIMsm3z4y+JnGFskiSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hT2tNv90;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5EE606A31C
	for <mfd@lists.linux.dev>; Thu, 26 Nov 2026 10:24:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F5EE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hT2tNv90
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B0704C2B9C6;
	Thu, 26 Nov 2026 10:24:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6E7F660237;
	Thu, 26 Nov 2026 10:24:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA70211E6A5EC;
	Thu, 26 Nov 2026 11:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795688670; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HWXhD2T0YqRDo710NdzVWCmw80S5rSuIE5qAwGglR9Q=;
	b=hT2tNv90ahKjUQOa2PA9w+ig6qobgxqJGnnsNUsMe71Jj8uMN8jI0+7woKeG0XQaba8s0o
	0rAl+v6dGXw4zWstY2by8epYPzTD5qX1FVC1uOwpzCXMj/WMNc3WlmvZm4NSX/XIvKuUtW
	hauygcBny7aVlM+8z562vmsGNdssOq23cbAQyamxzOAtiIyXLuk+9+I7R6nF3vyIXQa8I1
	ERBxzOI9xKVeJFR7U/5t3dHbdxa1y4cgcpbO2kj+tkIjnA5xEzjXeIDBLyZDweWd1yb5K2
	HW8RIJYF3jsf2v2aGJ1gp/H/bR9/4AKnOtOKsGIv1UbbIAaM9Qz2PXhe93g5Tw==
Message-ID: <0e983410-bc97-46cf-9ee0-c4cd11dcfa64@bootlin.com>
Date: Thu, 26 Nov 2026 11:24:28 +0100
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
Subject: Re: [PATCH v6 00/10] Congatec Board Controller: Add storage devices
 support
To: Lee Jones <lee@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Werner Gartner <Werner.Gartner@congatec.com>, mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261117-cgbc-i2c-storage-devices-support-v6-0-bb070ad3e9aa@bootlin.com>
 <20261119190350.GB70182@joneslee-macbookpro.roam.internal>
Content-Language: en-US
From: Thomas Richard <thomas.richard@bootlin.com>
In-Reply-To: <20261119190350.GB70182@joneslee-macbookpro.roam.internal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 11/19/26 8:03 PM, Lee Jones wrote:
> On Tue, 17 Nov 2026, Thomas Richard (congatec GmbH) wrote:
> 
>> This is the 6th iteration. As discussed with Lee [1] I just picked his I2C
>> patch [2] (to handle the conflict) and rebased the series on top of
>> next-20261116.
>>
>> [1] https://lore.kernel.org/all/c9d26395-93f8-4e63-9cd0-586ce913931b@bootlin.com/
>> [2] https://lore.kernel.org/all/20261027093306.2812695-27-lee@kernel.org/
> 
> I assume this all needs to go in at once?
> 
> So we just need the I2C Acks, then I can take the set and send out a PR.

Hi Andi,

Could you have a look to the I2C patches, Lee is waiting your ack to
apply the series in his tree.

Best Regards,
Thomas
