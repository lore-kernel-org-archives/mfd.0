Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC15D23ABA7
	for <mfd@lists.linux.dev>; Wed,  8 Jul 2026 13:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.149.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783515750; cv=fail; b=dQMpxyEW/NlyEaAee4obArMEgfVcKUcqWFzrpiHsGorIYR6R78RnQSwnmdMQv7m4yCkjf76FXnP95826FWvSIwtN2OTHueSCEOdtzgg5r5RtDjx/M726Q29tXBB/ZBw8QJUL9Z8mgpaD5meNrT9gcbaormewBC1idzSlxHV5JUc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783515750; c=relaxed/simple;
	bh=4fKQCyyXboLOG5QLGRtQMYZASB3EcRYNM3Rv1E8vyoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aw7/MJ+JY9i/FBVnZeOpnLgtMrL92Gr7i4TKwBhbOXgKRrXlRYBuVeDN177N1/1R7jamjqUPYmXMx55oyyX80Zn4M8kGR0SEAoLgMvEGVQD1FC3qlHxCdDqQUc2ppDxsmX3qZdR7KX7qwfqNW6dJYt9jRv5lrnEV2+jbZmiOV9A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=PKVreuI8; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=CfcICmq7; arc=fail smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="PKVreuI8";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="CfcICmq7"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668CkiOj1460829;
	Wed, 8 Jul 2026 08:02:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4fKQCyyXboLOG5QLGR
	tQMYZASB3EcRYNM3Rv1E8vyoQ=; b=PKVreuI8cys3dL3YsKLkKwWofjCEYsGtUB
	ttL2E6pDwKXqBQgi5vkueMN44p1hSxLnXZ1SU6SYlbj0bmdAa8/OVdlRiivayrbB
	yHun+nuZZhBEIKz6S3l4aCP6YdzbZw9hQvcsTYZpQq7Lr+sZFpbbQ92TQcok8DHO
	zoFpHhHSXXmKQhhloF/UqjZnkvbB51rLQyuhHDw9PNdUeiEUIjX53K+Z+1A8pha8
	greg4Tv/TAA9IZIfdBkiie96kZg2NGg+N0sLHL0Sv+2FT68P2zYsut4WElZhMytv
	cCNDzeQom4ADkCF5+EYQNe5XFXYPWmmv6KFg3dVpD6mw2uiHGexw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11022083.outbound.protection.outlook.com [52.101.48.83])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 4f6yjxp63j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 08 Jul 2026 08:02:26 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PjdyrSZhvcLOskfb/4PKP6zFgbt2WQ5rdRiHPunt/nlhdx72RfJEOUOMM6S1LO3+qfGZe7A6zYmY7Cr9iY0RXvzm8hgoaXqU5qGVHXMxBP8GpirfOpbb2rBhvgw8k7s3JDwxJR5/nmUlTkvqAfx02EuM3ORM2fABHMjG+q6Cp2IO+RpEcuucZLXmK38NiBwEpAyaU5w1iXTUlNGj+lpZH+XKM36A+bhna1MPPxPnkT2CMA02oxH2IYO5SlZoKZ8k1crFJjRecY1YcJMtMIWehwsfmQ3chHByaZNlkVaBIczNuY/YUYLr2dXYe4JnLMKXBWr9eKSEjpz3ittgo8hGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fKQCyyXboLOG5QLGRtQMYZASB3EcRYNM3Rv1E8vyoQ=;
 b=QM7PPADcmI9KcAjbAcl/58Fyk7Krn/1Xe8TxNe4+4xbkwlbiRE32COuljh7y2f+qAgMCQSGn/1iRvDQqvmg9PGmJIrgiA0pCpC/7iV5Iz0W8JQdmtqEba9m8TDuhJfkQQhy/6CzfpFwgQk3XA2YEOoxCsQpPg2qxNaB4p73axMojTsHrA2QP3QfIZQ6lR0fJEPWnac7XxosPoVZMYTtzwInKAj7e9r8U3JgHRUyu7nLkmmdZosut3dexu+Y+q76ATHknb8ukh+7OX10hoPYk6zWfhmcpXX67o2pYlPdaBNxbUjPOpBnVAHKAEOjPhr9MMWTYILelervYWNOwyqdQiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=kernel.org
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fKQCyyXboLOG5QLGRtQMYZASB3EcRYNM3Rv1E8vyoQ=;
 b=CfcICmq7LOC3a3BzECd6s8KJhXrUCvTv2UfHyALpq04uPPiBfYdKQLIq4+iNAaXNTdjD3IJpf2hTVvloQ/3VJ0bp77JM6iHSCVIjIQXkz6jD7Hn2bg5oy2qADsBVatVVLEokqVEYkQSq9unszyT8ySJkSXS6iwNdrqWfXYejrUI=
Received: from BN9PR03CA0882.namprd03.prod.outlook.com (2603:10b6:408:13c::17)
 by DS0PR19MB165550.namprd19.prod.outlook.com (2603:10b6:8:42f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Wed, 8 Jul 2026
 13:02:23 +0000
Received: from BN3PEPF0000B074.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::39) by BN9PR03CA0882.outlook.office365.com
 (2603:10b6:408:13c::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 13:02:23 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B074.mail.protection.outlook.com (10.167.243.119) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.6
 via Frontend Transport; Wed, 8 Jul 2026 13:02:22 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 5CF17406541;
	Wed,  8 Jul 2026 13:02:21 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 488CC82025A;
	Wed,  8 Jul 2026 13:02:21 +0000 (UTC)
Date: Wed, 8 Jul 2026 14:02:20 +0100
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: lee@kernel.org
Cc: mfd@lists.linux.dev, lee@kernel.org
Subject: Re: [PATCH] mfd: cs42l43: Remove redundant NULL checks on SoundWire
Message-ID: <ak5KXIj1I3l6Qodl@opensource.cirrus.com>
References: <20260708100914.1298080-1-ckeepax@opensource.cirrus.com>
 <20260708101650.BE6931F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: mfd@lists.linux.dev
List-Id: <mfd.lists.linux.dev>
List-Subscribe: <mailto:mfd+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:mfd+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708101650.BE6931F00A3A@smtp.kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B074:EE_|DS0PR19MB165550:EE_
X-MS-Office365-Filtering-Correlation-Id: 97c2f682-5aee-4f69-813d-08dedcf126d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|61400799027|82310400026|23010399003|30052699003|36860700016|4143699003|16102099003|22082099003|18002099003|56012099006|5023799004|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	iyH+7lkewQohyTlNBtytzYE6IShTwH4PHHVL/X0gdf4m+CIl4VU6/oTqP95M6qX7FWZiD3ZsriepQswLS2qnE3jqElGx/ymAF4PElHAgTo4EhiQCOLgo9jVvnHrMeNIKDSl1oG+36wB5YkdJtzTYy5Zo/J+0oy0uKlNKkxenLYUL7Vj8hJHurHg/BlvGM12kJ9F4i/3XAtgT7WzX1Ch3zcdSFTo/gfaob9FrKY/4qihsdnOjX3Bx+ccbwA9hvZOXe4N4Wv9hO3ZcpuiLX3mIpQltJ7es4GAh0a2fH4GbR30D5k3gDuMySksTUh7JsQ+A0XfjMXio9RCZx8lvurbSpaRtB7+t0HUe+enWuQCfPUQ9jDBwBzwqtPabrgB+xmKCB4Ey0LazrcsBLD7AP8v/tPaoriyF9KGabh7UUMZnmvMqytBCSyqOwldUZ55DR/pxIab52dbs15uyUT6TwXSxEk4w4CQx8mkKmS1nbbQyM6pjaSeCqMvOpsdbGSNNS11K0iehqipF+fBOYDO0ALyMrB035cbHc9/VnwawBC31Y9HfuroA1A387MOhcaBQ9cahdaAGX8s3nRDnOY0V98+xgPB19hb23DeF6gUQfxJp/nxtlSEBc/qoDp5/rQEsT12JNuEDIPTsrz7LgmwSkiR+OZi54Q5USN8b9/Uyu7kcy6L4uT7gp0ZfxUy2hmDprW1QGKxL+08JQrKPXJjXX/LkNw==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(61400799027)(82310400026)(23010399003)(30052699003)(36860700016)(4143699003)(16102099003)(22082099003)(18002099003)(56012099006)(5023799004)(11063799006)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vdtWsJcSGEMV5z6EVbZeyrKspGXJ9eiUelmt75CZ8PIXvNeFeCPpwE5RAv3xI8TzOEpPVGGNOl94yML2KcS8VwKwbMZNCTPGU2u+VYlvA3IMKMMF1rAzI7kTJqp++/1a6tcXKgGIedopeB2jSxDpWyYgKtBFgrVQOlcXQQWP8qrYhvXjZJXiFpK1wueyD4dxkxc+WlvLwFFXKJjjP7p0Z0tj7hDZZojlw1Ti0yOOk+w0KqnBqTQGlzqOrF/iO5x4+BbOyLpTS3KsD4ulIBqDJ+p0rNchuUgVLnOpSayk2QTRLNm2AZNyYOSyharcFPG0okr0MlW1ULm3KsjfJnZamSVhIt221JMgAmC86Gvb8FhU6B8jEItKI9AMnq3We+s3jkIbJvnPjB1aISqy/Dnsomgf7jZuiu9y45LIqS/WugWElP7+bOxQmx9AVWmP7Yhr
X-Exchange-RoutingPolicyChecked:
	UiVBO4ShAe5TlbndkEN1N6Lpt2RA0BnfA3urD/7LOu734kvf5CJXj04IIEeeSXpSLmwGTzdhYk3tiNN3OGDxLGveUqJoB62JLUekiBetggT1frnrzzwTLhaX4uya8rdhJ5yGkNQhhx6cJqRMfNQ1MJSn4kRYeI9kmNQajLyiJV/ww+BRaD8TJLvVdjE4uDU8mCVv058BYNSwmhS1+WGV4hmPJ2E29UlSvbOuAVsyW0vNrfsIracwuC6R6w/cihFYQ9gLh2tYJyG9Bvrxru492/wrfKOZn0xgqpDrSU+LwpMGhwRXcN1aTdUUjJUV+dhAjQRsu3CBSoD9B/tLJR0NwQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 13:02:22.7690
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97c2f682-5aee-4f69-813d-08dedcf126d3
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B074.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR19MB165550
X-Authority-Analysis: v=2.4 cv=Fo81OWrq c=1 sm=1 tr=0 ts=6a4e4a62 cx=c_pps
 a=80uo2vwcsYp3yIYYF8sMvw==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=Dj2-6B8FqX4mGL0U3gbX:22
 a=VwQbUJbxAAAA:8 a=XDxexocyPQkaJRKltUEA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyNiBTYWx0ZWRfXzp3/YYaMWZrA
 CutT7kLK46bqFuzsmmi6n7K7leLDSk4I07IFQ01CLqYKUdpPKayXU5b4S6myKPJbD8JXidLPDq0
 yl8bnzB3Fc31H6QIzqDUR5AGa8/GBWs=
X-Proofpoint-GUID: ktTJddPdjRb3GvUwL4n4yvIWcSc4V2ng
X-Proofpoint-ORIG-GUID: ktTJddPdjRb3GvUwL4n4yvIWcSc4V2ng
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyNiBTYWx0ZWRfXxqn7cyMshSL1
 4ed0fUSZiw3eTGzXW177zMQxvAfUf3ZJ+yoKJL9zw5jFhCjPxZHgNFGDWdVvzWClh+14dU6NCbs
 MbsdSzRE2rlMqhKs1LgZUztEgoMtO0iz9yOZQG8+1P24FVSOm6ABY3Sb2MRxFejWDeyBMIQlRTB
 SED0qAAoicgG1Ay8TTWZeFzgSY2+4+y1JqVOwPakCNdX462pMKKQ/fx28J5110iU4o7nKSC7Sum
 cf3rIkeLNM7grejklJguPIN8aZELbJEDzgrques8JsEvNjbjXMEhHoa2XUNX0k81E2Ddef1Ne4J
 BG2GzmUm6LXwzLYeZQHZTZjVxfSDIGDBNEFshSWznOK2HdnkxYvkkQFxppk3j2cGwo2Ac2gf7uT
 8yODm+Ldl4CVDDXebySmRy1AnagwdQ1Wb/M8YEtJBMmCj6s0dJpcu2MccPTwzIhZ8NV/W6puXW+
 OmfHz/W3AVEUyq7omtg==
X-Proofpoint-Spam-Reason: safe

On Wed, Jul 08, 2026 at 10:16:50AM +0000, sashiko-bot@kernel.org wrote:
> Pre-existing issues:
> - [High] This problem wasn't introduced by this patch, but
> hard-coding MFD cell device IDs with PLATFORM_DEVID_NONE violates
> subsystem guidelines and can lead to sysfs naming collisions.

Yeah this is true, however a) the chances of multiple cs42l43
systems is quite low, if one is coming up we will spend more
cycles on this issue, and b) unfortunately there is fairly major
surgery to be done on the Intel machine driver stuff to
facilitate this. It currently relies on the naming to identify
the audio dai links.

Thanks,
Charles
